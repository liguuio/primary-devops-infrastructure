# command: docker build --no-cache -t gd.clic/gitlab:20191202 .
# check: docker run gd.clic/gitlab:20191202 date
FROM gitlab/gitlab-ce:12.4.5-ce.0

ENV MY_TZ Asia/Shanghai

# OFFLLINE BUILD
# ENV TZDATA_PACKAGE_NAME tzdata_2019a-0ubuntu0.16.04_all.deb
# ENV TZDATA_SRC_URL ./$TZDATA_PACKAGE_NAME
# ENV TZDATA_TRG_URL /opt/$TZDATA_PACKAGE_NAME
# # ajust timezone for ubuntu16.04 note that rm opera is necessary

# COPY $TZDATA_SRC_URL /opt

# RUN set -xe && \
# 		dpkg -i $TZDATA_TRG_URL && \
# 		rm -rf /etc/localtime && \
# 		ln -snf /usr/share/zoneinfo/$MY_TZ /etc/localtime && \
# 		echo $MY_TZ > /etc/timezone && \
# 		dpkg-reconfigure -f noninteractive tzdata && \
# 		apt-get clean

# ONLINE BIULD
RUN set -xe && \
		apt-get update && apt-get install -y tzdata && \
		rm -rf /etc/localtime && \
		ln -snf /usr/share/zoneinfo/$MY_TZ /etc/localtime && \
		echo $MY_TZ > /etc/timezone && \
		dpkg-reconfigure -f noninteractive tzdata && \
		apt-get clean

RUN set -xe && \
    echo "gitlab_rails['time_zone'] = 'Asia/Shanghai'" >> /etc/gitlab/gitlab.rb