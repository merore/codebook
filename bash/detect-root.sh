#!/bin/bash

ROOT_UID=0
E_NOTROOT=87

if [ "$UID" -ne "$ROOT_UID" ]; then
    echo "Must be root to run this script."
    exit $E_NOTROOT
fi

exit 0
