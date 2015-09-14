FROM centos:7

RUN yum -y -q update && \
    yum -y -q install unzip && \
    yum -q clean all && \
    rm -rf /var/cache/* /var/lib/yum/lists/* /tmp/* /var/tmp/*
    
RUN mkdir -p /opt/consul/data /etc/consul.d && \
    cd /opt/consul && \
    curl -L https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip -o consul_web_ui.zip && \
    unzip consul_web_ui.zip && \
    mv dist/ ui/ && \
    rm consul_web_ui.zip && \
    curl -L https://dl.bintray.com/mitchellh/consul/0.5.2_linux_amd64.zip -o consul.zip && \
    unzip consul.zip && \
    rm consul.zip && \
    ln -s $PWD/consul /usr/local/bin/consul

EXPOSE 8300 8301 8302 8400 8500 8600

ENTRYPOINT ["/opt/consul/consul", "agent", "-data-dir", "/opt/consul/data", "-config-dir", "/etc/consul.d"]
