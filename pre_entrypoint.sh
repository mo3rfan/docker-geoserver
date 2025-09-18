#!/usr/bin/env bash
set -x
chown -R $UNAME /gs_context/
exec gosu "$UNAME" "/entrypoint.sh"