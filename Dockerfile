FROM openjdk:alpine

VOLUME ["/data", "/scripts"]

RUN apk add --no-cache git && \
    apk add --no-cache bash && \
    apk add --no-cache maven

COPY scripts /scripts/
RUN mkdir -p /data/plugins
COPY bin/* /data/plugins/

ENTRYPOINT ["/scripts/setup-server.sh"]
