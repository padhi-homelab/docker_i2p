FROM alpine:3.15 as builder

ENV APP_HOME="/i2p"

RUN apk add --update --no-cache \
        apache-ant \
        gettext \
        git \
        openjdk11 \
 && cd /tmp \
 && git clone --depth 1 --branch i2p-1.7.0 \
              https://github.com/i2p/i2p.i2p.git \
 && cd i2p.i2p \
 && ant preppkg-linux-only \
 && rm -rf pkg-temp/osid pkg-temp/lib/wrapper pkg-temp/lib/wrapper.*


FROM padhihomelab/alpine-base:3.15.0_0.19.0_0.2

ENV APP_HOME="/i2p"

RUN apk add --update --no-cache openjdk11-jre

COPY --from=builder \
    /tmp/i2p.i2p/pkg-temp \
    ${APP_HOME}

COPY entrypoint-scripts \
     /etc/docker-entrypoint.d/99-extra-scripts

COPY i2p.sh \
     /usr/local/bin/i2p
COPY config/* \
     /i2p/

RUN chmod +x /usr/local/bin/i2p \
             /etc/docker-entrypoint.d/99-extra-scripts/*.sh

EXPOSE 7654 7656 7657 7658 4444 6668 7659 7660 4445 12345
VOLUME ["${APP_HOME}/.i2p", "/i2psnark"]

WORKDIR ${APP_HOME}

CMD [ "i2p" ]

HEALTHCHECK --start-period=10s --interval=30s --timeout=5s --retries=3 \
        CMD ["wget", "--tries", "5", "-qSO", "/dev/null",  "http://localhost:7657/"]
