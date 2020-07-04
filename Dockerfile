FROM ldez/traefik-certs-dumper:v2.7.0

RUN apk --no-cache add inotify-tools util-linux bash docker

COPY run.sh /

VOLUME ["/traefik"]
VOLUME ["/output"]

ENTRYPOINT ["/run.sh"]
