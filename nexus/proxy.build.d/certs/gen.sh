# X.Y.Z.W is your server IP

# generate key for ca-generation
openssl genrsa -aes256 -out ca-key.pem 4096

# generate CA certificate, if for docker registry, CN name must be registry IP
openssl req -new -x509 -days 180 -key ca-key.pem -sha256 -out ca.pem

# generate server key for nginx
openssl genrsa -out X.Y.Z.W-server-key.pem 4096

openssl req -subj "/CN=X.Y.Z.W" -sha256 -new -key X.Y.Z.W-server-key.pem -out X.Y.Z.W.csr

# if no extfile, chome reports NET::ERR_CERT_COMMON_NAME_INVALID (serverAuth actually is not necessary, which is just for docker server )
echo -e 'subjectAltName=IP:X.Y.Z.W,IP:127.0.0.1\nextendedKeyUsage=serverAuth' > extfile.cnf

# generate nginx server key
openssl x509 -req -days 180 -sha256 -in X.Y.Z.W.csr -CA ca.pem -CAkey ca-key.pem \
  -CAcreateserial -out X.Y.Z.W-server-cert.pem -extfile extfile.cnf
