#!/bin/bash

readonly ABSPath=$(cd $(dirname $0); pwd)

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

main() {
    echo $ABSPath
}

main "$@"
