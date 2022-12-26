#!/bin/bash

COMMON_PROFILE=$HOME/.profile_common

if [ -e $COMMON_PROFILE ]
then source $COMMON_PROFILE
fi

export DVM_DIR="/root/.dvm"
export PATH="$DVM_DIR/bin:$PATH"
. "$HOME/.cargo/env"
