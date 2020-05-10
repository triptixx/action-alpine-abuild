#!/bin/sh
set -eo pipefail

# ANSI colour escape sequences
RED='\033[0;31m'
RESET='\033[0m'
error() { >&2 echo -e "${RED}Error: $@${RESET}"; exit 1; }

# $INPUT_PRIVATE_KEY          this is the contents of your RSA private key
# $INPUT_PUBLIC_KEY           this is the contents of your RSA public key





  mkdir -p "$REPODEST" /home/builder/.abuild
  abuild-apk update
  [ "$RSA_PRIVATE_KEY" ] && {
    echo -e "$RSA_PRIVATE_KEY" > "/home/builder/.abuild/$RSA_PRIVATE_KEY_NAME"
    export PACKAGER_PRIVKEY="/home/builder/.abuild/$RSA_PRIVATE_KEY_NAME"
  }
  sudo chown -R builder:abuild /home/builder/package
  sudo chown -R builder:abuild $REPODEST

  exec abuild "$@"
