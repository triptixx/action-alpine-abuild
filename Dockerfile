FROM alpine:latest

COPY *.sh /usr/local/bin/
RUN apk add --no-cache alpine-sdk; \
    addgroup `whoami` abuild; \
    chmod 755 /usr/local/bin/*.sh;

ENTRYPOINT [ "/usr/local/bin/abuilder.sh" ]
