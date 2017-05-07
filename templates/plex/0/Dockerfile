FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl grep unzip wget

RUN curl -qL $(curl "https://plex.tv/downloads/latest/1?channel=8&build=linux-ubuntu-x86_64&distro=ubuntu" | \
              grep -Eo 'https[^" ]*deb') \
         -o plexmediaserver.deb \
    && dpkg -i plexmediaserver.deb \
    && rm plexmediaserver.deb

ENV PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
ENV PLEX_MEDIA_SERVER_HOME="/usr/lib/plexmediaserver"
ENV PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000
ENV PLEX_MEDIA_SERVER_TMPDIR="/tmp"
ENV PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="/Library/Application Support"

RUN wget -q https://github.com/trakt/Plex-Trakt-Scrobbler/archive/master.zip \
    -O /Plex-Trakt-Scrobbler.zip \
 && unzip /Plex-Trakt-Scrobbler.zip \
 && mkdir -p "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Plug-ins/" \
 && cp -r Plex-Trakt-Scrobbler-*/Trakttv.bundle \
    "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/Plug-ins/"

ENV LD_LIBRARY_PATH="${PLEX_MEDIA_SERVER_HOME}"

VOLUME /Library

RUN ulimit -s $PLEX_MAX_STACK_SIZE

EXPOSE 32400

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
