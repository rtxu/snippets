#!/bin/bash

usage()
{
    cat <<EOF
EOF
}

log()
{
    echo "[$(date +'%F %T')] $@"
}

err()
{
    log "$@"
    exit 1
}
