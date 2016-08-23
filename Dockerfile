FROM  registry.access.redhat.com/rhel7.2:latest
MAINTAINER akram@free.fr
RUN yum repolist --disablerepo=* && \
    yum-config-manager --disable \* > /dev/null && \
    yum-config-manager --enable rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-ose-3.2-rpms > /dev/null
RUN yum install -y squid
ADD squid.conf /etc/squid/squid.conf
ADD run.sh /run.sh

# Make cache dirs 
RUN squid -z -F
RUN yum install -y nc
EXPOSE 3128
CMD /run.sh
