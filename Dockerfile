FROM alpine:latest

COPY *.sh /usr/local/bin/
RUN apk add --no-cache alpine-sdk coreutils cmake; \
    adduser -G abuild -g "Alpine Package Builder" -D builder; \
    echo "builder ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/builder; \
    chmod 755 /usr/local/bin/*.sh;
USER builder

ENTRYPOINT [ "/usr/local/bin/abuilder.sh" ]