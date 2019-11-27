# build: gd.clic/nexus:20191127
# command: docker build --no-cache -t gd.clic/nexus:20191127 .

FROM sonatype/nexus3:3.19.1
USER root
# ajust timezone for centos7 where tzdata is installed
RUN set -xe && \
	ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
	echo Asia/Shanghai > /etc/timezone
USER nexus