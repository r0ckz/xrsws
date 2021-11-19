#!/bin/bash
# Script for performing random commands for all torrents
# Usage: wsgeneric-all.sh "<action> INSERTHASH" or wsgeneric-all.sh "<action> INSERTHASH <action>" (explicitely state 'INSERTHASH' instead of an actual hash)
#
# Same things as wsgeneric but with 'INSERTHASH' as the hash.
# Examples:
# ./wsgeneric-all.sh "d.stop INSERTHASH
# ./wsgeneric-all.sh "t.multicall B0E1DC29C1C8842D2E9A2B2754DFB80F129A6541 '' t.enable="

list=`xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php download_list -username=usr00001 -password=PasswordHere123!`

list=($(echo $list | sed -n "s/^.*'\(.*\)'.*$/\1/ pg")) #simply only keep the hashes by looking for text between ''s

readarray -t <<<$list #create array from list, use with ${MAPFILE[X]}, in loop with [$i]

for i in "${!MAPFILE[@]}"; do
if [ "$#" -eq  "0" ] #check if parameter was given, otherwise it would only send the hash without any action.
then
echo "You need to specify a parameter (without the hash)."
else
inputwithhash=$(echo $1 | sed "s/INSERTHASH/${MAPFILE[$i]}/") #normally you could just do $1 ${!MAPFILE[@]}, then the action like 'd.close' would be enough, but it would become a mess because multicall should still be working etc. I did that for the cURL version. This way, you specify the hash with INSERTHASH and the rest works the same as wsgeneric.
xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php $inputwithhash -username=usr00001 -password=PasswordHere123!
fi
done