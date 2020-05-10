#!/bin/sh
set -eo pipefail

# ANSI colour escape sequences
RED='\033[0;31m'
RESET='\033[0m'
error() { >&2 echo -e "${RED}Error: $@${RESET}"; exit 1; }

# $INPUT_PRIVATE_KEY          this is the contents of your RSA private key
# $INPUT_PUBLIC_KEY           this is the contents of your RSA public key

if [ (-n "$INPUT_PRIVATE_KEY" -a -z "$INPUT_PUBLIC_KEY") -o (-z "$INPUT_PRIVATE_KEY" -a -n "$INPUT_PUBLIC_KEY") ]; then
    error "Missing 'private_key' or 'public_key' argument for packages signed"
fi

PACKAGER_PRIVKEY="/home/builder/.abuild/-5eb861d9.rsa"
/etc/apk/keys/-5eb861d9.rsa.pub
REPODEST=$HOME/packages/
export PACKAGER="Glider Labs <team@gliderlabs.com>"
