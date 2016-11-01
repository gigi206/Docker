#!/bin/bash
[ ! -z "$UNLOAD_MODULES_APACHE2" ] && \
for MODULE in $UNLOAD_MODULES_APACHE2
do
	INFO "\n* Unloading apache2 module $MODULE"
	if [ -e /etc/apache2/mods-enabled/${MODULE}.load ]; then
		CMD "a2dismod $MODULE" || exit $?
		INFO "  Apache2 module $MODULE unloaded"
	else
		INFO "  Apache2 module $MODULE already unloaded"
	fi
done

[ ! -z "$LOAD_MODULES_APACHE2" ] && \
for MODULE in $LOAD_MODULES_APACHE2
do
	INFO "\n* Loading apache2 module $MODULE"
	if [ ! -e "/etc/apache2/mods-enabled/${MODULE}.load" ]; then
		CMD "a2enmod $MODULE" || exit $?
		INFO "  Apache2 module $MODULE loaded"
	else
		INFO "  Apache2 module $MODULE already loaded"
	fi
done
