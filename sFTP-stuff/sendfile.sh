#!/bin/bash
#Only works in bash, not in 'sh'. Sshpass needs to be installed for pass automation. An alternative would be expect/send commands. Also, it's best to connect at least once without sshpass to accept the fingerprint.
#Usage: ./sendfile.sh /home/user/test.txt (Beginning slash is optional in most cases, in this case we're going to the path /torrents/upl/. $1 needs '' around it so it's not seen as plain text inside the commands ''s.
sshpass -p 'PasswordHere123!' sftp usr00001@s1.seedboxws.com:/torrents/upl/ <<< $'put '$1''