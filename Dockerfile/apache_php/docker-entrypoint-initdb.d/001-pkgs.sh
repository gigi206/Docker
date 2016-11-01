#!/bin/bash
[ ! -z "$INSTALL_PKGS" ] && \
for PKG in $INSTALL_PKGS
do
		INFO "\n* Installing $PKG"
		CMD "dpkg -l $PKG &>/dev/null" 
		if [ $? -ne 0 ]; then
			CMD "apt-get install -yq $PKG" && INFO "  $PKG sucessfully installed" || exit $?
		else
			INFO "  $PKG is already installed..."
		fi
done
