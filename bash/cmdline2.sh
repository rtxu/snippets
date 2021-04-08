#!/bin/bash

# ref: https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash

# [option
OPT_SYNC_ONLY="false"
IS_UNIFIED_BRANCH="false"
# option]

POSITIONAL=()
while [[ $# -gt 0 ]]
do
  option_name="$1"
  case ${option_name} in
    -h|--help)
      usage
    ;;

    -s|--sync_only)
      OPT_SYNC_ONLY="true"
      shift # past argument
    ;;

    -u|--is_unified_branch)
      IS_UNIFIED_BRANCH="true"
      shift # past argument
    ;;

    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
    ;;
  esac
done
set +u
set -- "${POSITIONAL[@]}" # restore positional parameters
set -u
