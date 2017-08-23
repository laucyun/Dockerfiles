FROM centos:6.8

MAINTAINER LauCyun <liu@liuker.xyz>

RUN yum -y update && yum clean all
RUN yum install vim -y && yum clean all

RUN rpm -Uvh https://mirrors.tuna.tsinghua.edu.cn/epel/6/i386/epel-release-6-8.noarch.rpm
RUN rpm -Uvh http://remi.mirrors.arminco.com/enterprise/remi-release-6.rpm

RUN yum --enablerepo=remi,remi-test install mysql mysql-server -y && yum clean all

ADD docker-entrypoint.sh /home/entrypoint.sh
RUN chmod u+x /home/entrypoint.sh

EXPOSE 3306

CMD ["/home/entrypoint.sh"]