#!/bin/bash

# like #ifndef/define/endif 
# source file_guard.sh || return 0

# Returns:
#   0 -- the caller is sourced for the first time
#   1 -- the caller has been sourced before
set +u
__filename__=${BASH_SOURCE[1]##*/}
__filename__=$(echo $__filename__ | tr 'a-z .' 'A-Z__')
if eval "[ -z \$DEFINE_${__filename__} ]"; then
  eval "DEFINE_${__filename__}=1"
  set -u
  return 0
fi
set -u
return 1
