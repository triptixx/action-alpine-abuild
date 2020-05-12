#!/bin/sh
set -eo pipefail

# ANSI colour escape sequences
RED='\033[0;31m'
RESET='\033[0m'
error() { >&2 echo -e "${RED}Error: $@${RESET}"; exit 1; }

# $INPUT_PRIVATE_KEY          the contents of your RSA private key
# $INPUT_PUBLIC_KEY           the contents of your RSA public key
# $INPUT_PACKAGER             the name of the package used in package metadata

if [ \( -n "$INPUT_PRIVATE_KEY" -a -z "$INPUT_PUBLIC_KEY" \) -o \
        \( -z "$INPUT_PRIVATE_KEY" -a -n "$INPUT_PUBLIC_KEY" \) ]; then
    error "Missing 'private_key' or 'public_key' argument for packages signed"
else
    echo "$INPUT_PUBLIC_KEY" > /etc/apk/keys/abuild.rsa.pub

    ABUILD_DIR="${HOME}/.abuild"
    ABUILD_RSA="${ABUILD_DIR}/abuild.rsa"

    mkdir -p "$ABUILD_DIR"
    echo "$INPUT_PRIVATE_KEY" > "$ABUILD_RSA"
    chmod 600 "$ABUILD_RSA"
    export PACKAGER_PRIVKEY="$ABUILD_RSA"
fi

export PACKAGER="${INPUT_PACKAGER:-Glider Labs <team@gliderlabs.com>}"

cd "$GITHUB_WORKSPACE"

apk update
abuild-apk update
exec abuild -vcrF
