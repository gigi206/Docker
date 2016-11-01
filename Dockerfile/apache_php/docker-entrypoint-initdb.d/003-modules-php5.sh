#!/bin/bash
#LOAD_MODULES_APACHE2="ssl"
[ ! -z "$UNLOAD_MODULES_PHP5" ] && \
for MODULE in $UNLOAD_MODULES_PHP5
do
	INFO "\n* Unloading PHP5 module $MODULE"
	CMD "php5query -s apache2 -m $MODULE -q"
	if [ "$?" -eq 0 ]; then
		CMD "php5dismod $MODULE" && INFO "  PHP5 module $MODULE unloaded" || exit 1
	else
		INFO "  PHP5 module $MODULE already unloaded"
	fi
done

[ ! -z "$LOAD_MODULES_PHP5" ] && \
for MODULE in $LOAD_MODULES_PHP5
do
	INFO "\n* Loading PHP5 module $MODULE"
	CMD "php5query -s apache2 -m $MODULE -q"
	if [ "$?" -eq 0 ]; then
		INFO "  PHP5 module $MODULE already loaded"
	else
		CMD "php5enmod $MODULE" && INFO "  PHP5 module $MODULE loaded" || exit 1
	fi
done
