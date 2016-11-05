#!/bin/bash
#set -eo pipefail

function INFO() {
	printf "\033[1;33m$1\033[0m\n"
}

function WARN() {
	printf "\033[0;31m$1\033[0m\n"
}

function CMD() {
	printf "\033[0;32m  => $1\033[0m"
	OUTPUT=`eval $1 2>&1`
	RET=$?
	[ "$RET" -eq 0 ] &&  printf "\033[0;32m (RETURN $RET)\n\033[0m" || printf "\033[0;31m (RETURN $RET)\n\033[0m\n" ""
	[ -n "$OUTPUT" ] && echo "$OUTPUT"
	return $RET
}

function STEP() {
	printf "\033[0;36m\n>>> $1 <<<\033[0m\n"
}

#function STOP() {
#	INFO "Stopping $PROGRAM"
#	killall $PROGRAM
#
#}

PROGRAM="apache2"

#trap STOP SIGTERM

if [ "`echo $1 | awk '{ print $1 }'`" == "$PROGRAM" ]; then
	[ -f /etc/apache2/envvars ] && source /etc/apache2/envvars

	[ -d "/docker-entrypoint-initdb.d/" ] && for file in /docker-entrypoint-initdb.d/*; do
		case "$file" in
			*.sh)
				STEP "$0 running $file"
				. "$file" || WARN "Error while running $file !"
			;;
			*)
				INFO "$0 ignoring $file"
			;;
		esac
	done

	#INFO "\n* Test Apache2 config"
	#CMD "apache2ctl configtest"
	#if [ "$?" -eq 0 ]; then
	#	INFO "  Apache1 config OK"
	#else
	#	WARN "  Problem in apache2 config !"
	#	exit 1
	#fi

	# http://patorjk.com/software/taag/#p=display&f=Slant
	INFO '
	    ___                     __        ___               ____  __  ______  ______
	   /   |  ____  ____ ______/ /_  ___ |__ \      __     / __ \/ / / / __ \/ ____/
	  / /| | / __ \/ __ `/ ___/ __ \/ _ \__/ /   __/ /_   / /_/ / /_/ / /_/ /___ \  
	 / ___ |/ /_/ / /_/ / /__/ / / /  __/ __/   /_  __/  / ____/ __  / ____/___/ /  
	/_/  |_/ .___/\__,_/\___/_/ /_/\___/____/    /_/    /_/   /_/ /_/_/   /_____/   
	      /_/        _____ __             __  _                                     
			/ ___// /_____ ______/ /_(_)___  ____ _                         
			\__ \/ __/ __ `/ ___/ __/ / __ \/ __ `/                         
		       ___/ / /_/ /_/ / /  / /_/ / / / / /_/ /                          
		      /____/\__/\__,_/_/   \__/_/_/ /_/\__, /                           
						      /____/                            
'
fi

exec $@ $APACHE2_START_ARG
