#!/bin/bash
# Usage: "wsgeneric-curl.sh <action> <hash of torrent>" or "wsgeneric-curl.sh <action> <hash of torrent> <action>"
# Examples:
# wsgeneric-curl.sh t.multicall <hash> '' t.enable=
# wsgeneric-curl.sh d.close <hash>
#
if [ "$#" -eq  "2" ]; then #two parameters? Good! Put the command first and then the hash.
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>'$1'</methodName><params><param><value><string>'$2'</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php
elif [ "$1" = "t.multicall" ]; then #if the first parameter is t.multicall, use the right format. Leave the '' out. This is based on the t.enable format and is much harder to do in preformatted XML than with the actual XMLRPC command.
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>'$1'</methodName><params><param><value><string>'$2'</string></value></param><param><value><string></string></value></param><param><value><string>'$3'</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php
else
echo "Specify an action and hash."
fi