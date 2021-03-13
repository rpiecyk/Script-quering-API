#!/usr/bin/sh

## vars
# $1 - actual token
# current dir
SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# token file
T_FILE="env_file"

## func
check_for_arg() {
	[ $# -ne 1 ] && printf "\nPlease, provide just a token in 1st arg:\n\
$0 YOUR_TOKEN\n\n" && exit 1
}


override() {
	printf "token=$1" > $2/$3
}

# feeds all script args to function
check_for_arg $*

override $1 ${SCRIPTPATH} ${T_FILE}
