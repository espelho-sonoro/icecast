FROM centos:7
MAINTAINER "Espelho Sonoro Devs" <espelhosonoro@gmail.com>

RUN yum -y update && \
  yum clean all && \
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm && \
  yum -y install icecast
ADD icecast.xml /etc/icecast.xml
CMD sed -ri "s/PORT/$PORT/g" /etc/icecast.xml && \
  sed -ri "s/SOURCE_PASSWORD/$SOURCE_PASSWORD/g" /etc/icecast.xml && \
  sed -ri "s/RELAY_PASSWORD/$RELAY_PASSWORD/g" /etc/icecast.xml && \
  sed -ri "s/ADMIN_USER/$ADMIN_USER/g" /etc/icecast.xml && \
  sed -ri "s/ADMIN_PASSWORD/$ADMIN_PASSWORD/g" /etc/icecast.xml && \
  /bin/icecast -c /etc/icecast.xml
