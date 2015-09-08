FROM centos:7

RUN mkdir -p /opt/consul/data /etc/consul.d && \
    cd /opt/consul && \
    curl -s ftp://ci1.camunda.loc/ci/binaries/consul/consul-0.5.2.tar.gz | tar xz && \
    ln -s $PWD/consul /usr/local/bin/consul

EXPOSE 8300 8301 8302 8400 8500 8600

ENTRYPOINT ["/opt/consul/consul", "agent", "-data-dir", "/opt/consul/data", "-config-dir", "/etc/consul.d"]
