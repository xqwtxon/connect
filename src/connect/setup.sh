version="0.0.3"
TEMP="$PREFIX/tmp"
echo -n "[*] Setup Version: "
sleep 2s
echo "v$version"
echo -n "[*] Downloading Connect.sh: "
curl -sL "https://raw.githubusercontent.com/xqwtxon/connect.sh/v0.0.4/src/connect/connect" -o "$TEMP/connect.exec"
if [ ! "$?" == "0" ]; then
	echo "error" && echo "[!] Please check your connection and try again!" && exit 1
else echo "done"
fi
echo -n "[*] Downloading Update File: "
curl -sL "https://raw.githubusercontent.com/xqwtxon/connect.sh/v0.0.4/src/connect/update.sh" -o "$TEMP/connect.update.sh"
if [ ! "$?" == "0" ]; then
	echo "error" && echo "[!] Please check your connection and try again!" && exit 1
else echo "done"
fi
echo -n "[*] Move Connect.sh to $PREFIX/bin: "
sleep 2s
mv "$TEMP/connect.exec" "$PREFIX/bin/connect" && chmod +x "$PREFIX/bin/connect"
if [ ! "$?" == "0" ]; then
	echo "error" && echo "[!] Please check your bash permission! Please make sure the $PREFIX/bin is accessible to you." && exit 1
else echo "done"
fi
echo "[*] Installing requirements..."
if [ ! "$(command -v curl)" &> "/dev/null" ]; then
	echo -n "[*] Installing: cUrl"
	apt install curl
	echo "[*] Successfully Installed the Requirements!"
else echo "[*] Already Installed the Requirements!"
fi
echo "[*] Running the Updater Version Check..."
bash "$PREFIX/tmp/connect.update.sh" --version
echo "[!] Done! You can now type 'connect --help' to view command information!"
exit 0

rm -rf "$TEMP/connect.update.sh" # this should fixed to ensure no duplicates!
