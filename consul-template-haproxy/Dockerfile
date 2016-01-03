FROM alpine
MAINTAINER geniousphp

RUN apk --update add haproxy wget

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

COPY config.hcl /consul-template/config.d


EXPOSE 80 443

ENTRYPOINT ["consul-template"]
CMD ["-config=/consul-template/config.d/config.hcl"]