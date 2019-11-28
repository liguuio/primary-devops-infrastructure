# docker build --no-cache -t plugined-jksbo .

FROM jenkinsci/blueocean:1.21.0
# FROM jenkins/jenkins:lts

ENV MY_TZ Asia/Shanghai

USER root

# ! need internet connection
RUN set -xe \
  && apk add tzdata \
  && export TZ=$MY_TZ \
  && cp /usr/share/zoneinfo/$MY_TZ /etc/localtime \
  && echo $MY_TZ > /etc/timezone

USER jenkins

COPY plugins.list /usr/share/jenkins/ref/plugins.list
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.list