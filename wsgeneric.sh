#!/bin/bash
# Perform other generic actions with the same script.
# Usage: wsgeneric.sh "<action> <hash of torrent>"
#
# Examples:
# ./wsgeneric.sh system.listMethods - list all possible actions (use grep because the list is LONG)
# ./wsgeneric.sh load_start ~/foo.torrent - start torrent file
# ./wsgeneric.sh download_list - show list with active hashes (like wsls.sh)
# ./wsgeneric.sh d.start <hash> - start torrent by hash when stopped
# ./wsgeneric.sh d.stop <hash> - pause torrent by hash when active (stop=pause)
# ./wsgeneric.sh d.close <hash> - stop torrent by hash when active (close=stop)
# ./wsgeneric.sh d.state <hash> - show current state of torrent by hash
# ./wsgeneric.sh t.multicall <hash> '' t.enable= - enable all trackers (like wsenable.sh)
# ./wsgeneric.sh t.multicall <hash> '' t.disable= - disable all trackers
#
xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php $1 -username=usr00001 -password=PasswordHere123! #the action and hash are given as one parameter ($1), between "". This is a simple way to make this usable with and without a hash, another way is using if-statements.