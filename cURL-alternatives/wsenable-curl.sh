#!/bin/bash
# Usage: wsenable-curl.sh <hash of torrent>
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>t.multicall</methodName><params><param><value><string>'$1'</string></value></param><param><value><string></string></value></param><param><value><string>t.enable=</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php