#!/bin/bash
#Script for enabling trackers for all existing torrents at once. Just run the script.
#The script strips the hashes from the output, puts them in an array and enables the trackers for each of them.
#
#I made multiple versions of this script, because I was looking for the best way to strip the hashes from the output of the 'xmlrpc download_list' command and then perform 'xmlrpc t.enable=' for all of them.
#This version strips all text between ''s from the output (in this case only the hashes). With the other methods I removed all other lines and words from the output instead of extracting what I needed. I'm still learning haha.
#
#Example of standard output:
#Result:
#
#Array of 2 items:
#  Index  0 String: '<hash>'
#  Index  1 String: '<hash>'

list=`xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php download_list -username=usr00001 -password=PasswordHere123!`

list=($(echo $list | sed -n "s/^.*'\(.*\)'.*$/\1/ pg")) #simply only keep the hashes by looking for text between ''s

readarray -t <<<$list #create array from list, use with ${MAPFILE[X]}, in loop with [$i]

for i in "${!MAPFILE[@]}"; do
xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php t.multicall ${MAPFILE[$i]} '' t.enable= -username=usr00001 -password=PasswordHere123!
done
