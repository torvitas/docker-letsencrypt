#!/bin/bash

source /usr/local/bin/entrypoint.environment.sh
source /usr/local/bin/entrypoint.functions.sh

case ${1} in
    app:help)
        certbot --help
        exit 0
        ;;
    app:run)
        set -e
        runCertBot
        exit 0
        ;;
esac

exec "$@"
