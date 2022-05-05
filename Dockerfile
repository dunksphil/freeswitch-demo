FROM centos:7

RUN rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -i https://files.freeswitch.org/freeswitch-release-1-6.noarch.rpm
RUN sed -i -e 's/yum-1.6/yum_unstable/g' /etc/yum.repos.d/freeswitch.repo

RUN yum install -y -q \
    iproute

RUN yum install -y -q \
    freeswitch-1.9.0.1673-1.el7.centos \
    freeswitch-application-conference-1.9.0.1673-1.el7.centos \
    freeswitch-application-curl-1.9.0.1673-1.el7.centos \
    freeswitch-application-http-cache-1.9.0.1673-1.el7.centos \
    freeswitch-application-hash-1.9.0.1673-1.el7.centos \
    freeswitch-endpoint-verto-1.9.0.1673-1.el7.centos \
    freeswitch-lua-1.9.0.1673-1.el7.centos

RUN mkdir /transient/

RUN rm -r /etc/freeswitch/* || true
COPY config/ /etc/freeswitch/

RUN rm -r /usr/share/freeswitch/scripts/* || true
COPY scripts/ /usr/share/freeswitch/scripts/

RUN rm -r /usr/share/freeswitch/sounds/* || true
COPY sounds/ /usr/share/freeswitch/sounds/

COPY freeswitch /usr/local/bin
RUN chmod +x /usr/local/bin/freeswitch

CMD ["/usr/local/bin/freeswitch"]

