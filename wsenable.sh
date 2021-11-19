#!/bin/bash
# Usage: wsenable.sh <hash of torrent>
# Enable a tracker for a specific torrent by hash
xmlrpc https://s1-rutorrent.seedboxws.com/plugins/httprpc/action.php t.multicall $1 '' t.enable= -username=usr00001 -password=PasswordHere123!