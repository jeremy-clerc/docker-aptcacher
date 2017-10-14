FROM debian:stable

RUN apt-get -q update && DEBIAN_FRONTEND=noninteractive apt-get -yq install apt-cacher && apt-get clean

VOLUME ["/var/cache/apt-cacher", "/var/log/apt-cacher"]

EXPOSE 3142

USER www-data:www-data

ENTRYPOINT ["/usr/sbin/apt-cacher", "daemon_port=3142", "distinct_namespaces=1", "allowed_hosts='*'"]
