#!/usr/bin/env sh

cmd="murmurd -fg -ini "${DATA_PATH}"/murmur.ini"

if [[ ! -z ${SUPERUSER_PASSWORD} ]]; then
    cmd=$cmd" -supw "${SUPERUSER_PASSWORD}
fi

eval $cmd
