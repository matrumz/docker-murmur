#!/usr/bin/env sh

INI="${DATA_PATH}"/murmur.ini

if [[ ! -z ${SUPERUSER_PASSWORD} ]]; then
    murmurd -ini "$INI" -supw "${SUPERUSER_PASSWORD}"
fi

murmurd -fg -ini "$INI"
