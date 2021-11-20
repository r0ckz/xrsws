#!/bin/bash
# Checking available diskspace with supported diskspace plugin rather than SFTP. Just run the script.
# Extra dependencies: jq for extracting JSON vars, bc to get decimals.
#
# We don't have to send any XML for this, so we can use wget instead of cURL, because it's usually available by default on Debian-based systems. You also need to install 'jq' to parse the JSON output from the diskspace plugin.
data=`wget -cq --user=usr00001 --password=PasswordHere123! https://s1-rutorrent.seedboxws.com/plugins/diskspace/action.php -O -`

# Extract total and free from JSON and put it in a var, for calculating it to GB in the final echo.
total=`echo $data | jq --raw-output '.total'`
free=`echo $data | jq --raw-output '.free'`

#Added scale and bc to a simple $(($total / 1024 / 1024 / 1024)) to have 2 decimals instead of none. Use this as an alternative if you can't install bc, or use a more complex awk to get decimals.
echo -e "Total space: $(echo "scale=2;" $total/1024/1024/1024 | bc -l)GB\nFree space: $(echo "scale=2;" $free/1024/1024/1024 | bc -l)GB"