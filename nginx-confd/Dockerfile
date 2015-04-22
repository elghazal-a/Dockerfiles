FROM marceldegraaf/nginx
ADD ./conf.d/nginx.toml /etc/confd/conf.d/nginx.toml
# Add boot script
ADD ./boot.sh /opt/boot.sh
RUN chmod +x /opt/boot.sh
CMD /opt/boot.sh
