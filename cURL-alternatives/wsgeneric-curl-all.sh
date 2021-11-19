#!/bin/bash
# wsgeneric-curl.sh but for all torrents at once.
# Examples:
# wsgeneric-curl-all.sh d.stop (no hash needed, that will always just be pasted there.
# wsgeneric-curl-all.sh t.multicall INSERTHASH t.enable= (for multicalls, leave out '' and use INSERTHASH. Again, based on t.enable=/t.disable= so might not work for all variations.)
#
list=`curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>download_list</methodName><params></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php`

list=($(echo $list | grep -oP '(?<=string>)[^<]+'))

for i in ${!list[*]}
do
if [ "$#" -eq  "1" ]; then
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>'$1'</methodName><params><param><value><string>'${list[$i]}'</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php
elif [ "$1" = "t.multicall" ]; then #you can also leave out INSERTHASH by changing $3 to $2 and just not type anything for the hash at all. But it's some sort of placeholder.
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>'$1'</methodName><params><param><value><string>'${list[$i]}'</string></value></param><param><value><string></string></value></param><param><value><string>'$3'</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php
else
echo "Specify an action."
fi
done