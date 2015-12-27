FROM alpine
MAINTAINER geniousphp

ENV CONSUL_TEMPLATE_VERSION=0.12.0

RUN LAYER=consul-template                        \
    && CONSUL_TEMPLATE_VERSION=0.12.0 \
    && apk add --update ca-certificates \
    && wget https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip \
    && unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip \
    && mv consul-template /usr/local/bin/consul-template \
    && rm -rf consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip \
    && mkdir -p /consul-template /consul-template/config.d /consul-template/templates \
    && mkdir -p /logs /data \
    && apk del ca-certificates \
    && rm -rf /tmp/* /var/cache/apk/*

ADD haproxy.hcl /consul-template/config.d
ADD haproxy.ctmpl /consul-template/templates

EXPOSE 80 443

ENTRYPOINT ["consul-template"]
CMD ["-config=/consul-template/config.d/haproxy.hcl", "-consul=consul.service.consul:8500", "-dry"]