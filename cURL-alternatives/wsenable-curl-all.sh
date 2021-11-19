#!/bin/bash
#Script for enabling trackers for all existing torrents at once.
#The script strips the hashes from the output, puts them in an array and enables the trackers for each of them.
#
#Example of standard output with (HASH) as placeholder:
#<?xml version="1.0" encoding="UTF-8"?>
#<methodResponse>
#<params>
#<param><value><array><data>
#<value><string>(HASH)</string></value>
#<value><string>(HASH)</string></value>
#</data></array></value></param>
#</params>
#</methodResponse>

list=`curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>download_list</methodName><params></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php`

list=($(echo $list | grep -oP '(?<=string>)[^<]+')) #simply extract everything between string tags and put it in the list array

for i in ${!list[*]}
do
curl --header "Content-Type:application/xml" --data '<?xml version="1.0" encoding="UTF-8"?><methodCall><methodName>t.multicall</methodName><params><param><value><string>'${list[$i]}'</string></value></param><param><value><string></string></value></param><param><value><string>t.enable=</string></value></param></params></methodCall>' --user usr00001:PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php
done