#!/bin/bash
if [ -f "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid" ]; then
    rm "${PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR}/Plex Media Server/plexmediaserver.pid"
fi && ${PLEX_MEDIA_SERVER_HOME}/Plex\ Media\ Server
