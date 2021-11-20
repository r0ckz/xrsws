#!/bin/bash
# Enable a tracker for a specific torrent by hash
# Usage: wsenable.sh <hash of torrent>
xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php t.multicall $1 '' t.enable= -username=usr00001 -password=PasswordHere123!
