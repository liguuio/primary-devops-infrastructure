# docker build --no-cache -t 10.20.145.10:18012/library/node:13.2.0-alpine-with-sass .
FROM node:13.2.0-alpine
RUN npm install --loglevel silent -g serve
# For Alpine: linux_musl-x64-79_binding.node 
COPY linux_musl-x64-79_binding.node /opt/sass-deps/v4.13.0/linux_musl-x64-79_binding.node