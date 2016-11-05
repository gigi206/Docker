if [ -f /etc/update-startup ]; then
	INFO "\n* Updating OS..."
	CMD "apt-get update"
	INFO "\n* Update OS done"
fi
