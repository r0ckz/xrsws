#!/bin/bash
# Reboot seedbox, for example after a rTorrent crash. Just run the script.
#
echo "Rebooting seedbox..." #just a little message so we know the script is running, the request may take some time.

# We use wget instead of cURL because there's no XML, HTTP auth or POST request needed. Output should be '0' when seedbox has been rebooted successfully, otherwise it'll return 'Invalid credentials or seedbox not found.'. Url between "" or escape AND char (\&) to avoid problems with the shell.
data=`wget -q "https://console.seedboxws.com/assets/php/seedbox/reboot.php?user=usr00001&password=PasswordHere123!" -O -`

if [[ "$data" == "0" ]]; then #normally, we would use "-eq" instead of "==" for a value that is expected to be "0", but in this case a string is returned when wrong credentials are specified.
echo "Seedbox has been successfully restarted."
else
echo "Couldn't restart seedbox. Connection problems, invalid credentials or seedbox not found."
fi
