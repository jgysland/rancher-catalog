FROM alpine:3.5

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8'

RUN apk -U upgrade && \
    apk -U add \
        ca-certificates \
        py2-pip ca-certificates git python py-libxml2 py-lxml \
        make gcc g++ python-dev openssl-dev libffi-dev unrar tzdata \
        && \
    pip --no-cache-dir install --upgrade setuptools && \
    pip --no-cache-dir install --upgrade pyopenssl cheetah requirements && \
    git clone --depth 1 https://github.com/SickRage/SickRage.git /opt/sickrage && \
    apk del make gcc g++ python-dev && \
    rm -rf /tmp && \
    rm -rf /var/cache/apk/*

VOLUME ["/config", "/data", "/media"]

EXPOSE 8081

ENTRYPOINT ["/usr/bin/python", "/opt/sickrage/SickBeard.py"]
