#!/bin/env bash
#!/bin/bash
#!/bin/sh

# Update File for Connect.sh
# This copies the original style of Connect.sh
# Connect.sh will not being used in this file.

TEMP_FILE="$PREFIX/tmp/update.sh.cache"

if [ -e "$TEMP_FILE" ]; then
	mv "$TEMP_FILE" "$PREFIX/tmp/update-$(date +%F-%H-%I-%S).sh.cache"
fi

if [ "$1" == "--help" ]; then
	echo "Update For Connect.sh"
	echo ""
	echo "--help	Displays the Command Information"
	echo "--version Displays the Connect.sh Latest Version."
	echo "--update	Update Connect.sh to Latest Version."
	echo ""
	echo "Copyright by ReinfyTeam (c) 2022"
fi

if [ "$1" == "--version" ]; then
	echo -n "[*] Checking Github Server: "
	curl -sL "https://github.com/xqwtxon/connect.sh" >> $TEMP_FILE && rm -rf "$TEMP_FILE"
	if [ ! "$?" == "0" ]; then
		echo "bad" && echo "[!] Something went wrong when connecting cause a problem to host." && exit 1
	else echo "ok"
	fi
	echo -n "[*] Checking Latest Version: "
	curl -sL "https://raw.githubusercontent.com/xqwtxon/connect.sh/stable/version.txt" >> "$TEMP_FILE"
	if [ ! "$?" == "0" ]; then
		echo "unknown" && echo "[!] Something went wrong when checking latest version to the host." && exit 1
	else echo -n "v" && cat "$TEMP_FILE"
	fi
	echo -n "[*] Checking 'connect' version: "
	if [ ! $(command -v connect) &> /dev/null ]; then
		echo "connect command not found." && echo "[!] Make sure you have been installed your 'connect' program on $PREFIX/bin/connect before you're comparing versions." && exit 1
	else echo -n "v" && connect --version
	fi
	if [ ! "$(connect --version)" == "$(cat $TEMP_FILE)" ]; then
		echo "[*] New Update Found: $(connect --version) ~ v$(cat $TEMP_FILE)"
	else echo "[*] Already up to date."
	fi
fi

if [ "$1" == "--update" ]; then
	bash "${BASH_SOURCE[0]}" --version
	if [ "$?" == "0" ]; then
		TEMP_EXEC_FILE="$PREFIX/tmp/connect.update.sh"
		echo -n "[*] Getting latest 'connect' program: "
		curl -sL "https://raw.githubusercontent.com/xqwtxon/connect.sh/stable/src/connect/main.sh" >> "$TEMP_EXEC_FILE"
		if [ ! "$?" == "0" ]; then
			echo "bad"
		else echo "ok"
		fi
		cp "$TEMP_EXEC_FILE" "$PREFIX/bin/connect" && chmod +x "$PREFIX/bin/connect" # this should fixed soon...
		echo "[!] Sucessfully updated to latest version."
		exit 0
	fi
fi
