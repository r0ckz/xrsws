#!/bin/bash
#Usage: just run the script.
#Run 'sftp -oPort=22 NAME@HOST' first, to validate the certificate.
#
#Script to check the size of a directory on a server you only have SFTP credentials to. May take some seconds to calculate.
#This command logs into my server, goes to the folder 'torrents' and runs 'du -hs'.
#Methods like 'ls -lah' under plain SFTP only shows the right size of files, not folders.
#'df -h' under SFTP does output the used and available size of the entire disk, however, on a shared hosting that doesn't give you much personal info.
#
#Be sure to have 'lftp installed'. Needed because SFTP doesn't have options to check directory size built-in, and SSH isn't available in my case.
#:22 is usually optional but needed if your local SSH port is set on a different port. LFTP and SFTP will try to connect through the same port your own SSH server uses.
#As always, there are more commands and methods available, but this is the only one I tried that gives the free space for my account.
#
lftp -c 'connect sftp://usr00001:PasswordHere123!@s1.seedboxws.com:22/torrents; du -hs'