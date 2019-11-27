# build: gd.clic/nexusproxy:20191127
# command: docker build --no-cache -t gd.clic/nexusproxy:20191127 .

FROM nginx:alpine

COPY nginx.conf /etc/nginx/
COPY docker.registry.auth /usr/share/nginx/

COPY X.Y.Z.W-server-cert.pem /usr/share/nginx/
COPY X.Y.Z.W-server-key.pem /usr/share/nginx/

#   && apk add tzdata \
RUN set -xe \
  && export TZ=Asia/Shanghai \
  && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo Asia/Shanghai > /etc/timezone

EXPOSE 443