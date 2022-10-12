# rTorrent scripts for SeedboxWS (XML-RPC)
XML-RPC/cURL scripts to communicate with rTorrent through the commandline and perform certain actions, more specifically on a SeedboxWS box.

Originally not meant to be public, comments unfiltered and written for myself. Shared on request, scripts are from a while ago when I just started with bash.

Dependencies:
* sudo apt install xmlrpc-api-utils
* sudo apt install libxmlrpc-core-c3-dev

### Usage
The commands fired with these scripts are essentially (read comments in files for usage examples):
* wsls.sh - list all active torrents:
```
xmlrpc https://example.com/plugins/httprpc/action.php download_list -username=USERNAME -password=PASSWORD
```

* wsenable.sh - enable all trackers for a specific torrent.
```
xmlrpc https://example.com/plugins/httprpc/action.php t.multicall <HASH> '' t.enable= -username=USERNAME -password=PASSWORD
```

* wsenable-all.sh - same as above, but for all torrents at once. You don't need to specify a HASH.

* wsgeneric.sh - any action with username/password already specified in script (see comments in file for usage and examples like d.start and d.stop).
```
xmlrpc https://example.com/plugins/httprpc/action.php <ACTION> <HASH> -username=USERNAME -password=PASSWORD
```

* wsgeneric-all.sh - same as above, but for all torrents at once rather than for a specific hash. Only need to specify action.

* wsdiskspace.sh - check available disk space. Not a XML-RPC script, relies on wget, jq and bc. Gets JSON data from /plugins/diskspace/action.php.

* wsreboot.sh - reboot seedbox. Not a XML-RPC script, relies on wget. Sends GET request to /assets/php/seedbox/reboot.php and reports whether reboot was successful or not.

(Main scripts and examples use xmlrpc command, cURL clones/alternatives are present in cURL-alternatives folder, with hardcoded XMLs taken from the xmlrpc commands. Those scripts are for when xmlrpc isn't available on a certain distro or app like Termux. You can use this way in other code languages too, like PHP. Outputs will be XML).


Two SFTP scripts:
- sendfile.sh - for sending a file through the commandline. I never use this script anymore, I just SFTP into the box manually now.
- checkspace.sh - for checking free diskspace for your account. May take a few seconds to calculate. After feedback from the SeedboxWS admins, this script is now outdated given that we have a more supported script in the form of 'wsdiskspace.sh' (in the root folder of this project), which is much more efficient than using SFTP.
