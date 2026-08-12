#!/bin/bash

ZONE_ID="Your Cloudflare zone id"
DNS_RECORD_ID="Your record id" #It's a little tricky to get, check README.
CLOUDFLARE_API_TOKEN="Your Cloudflare API Token"
IP=$(curl -s http://checkip.amazonaws.com)
LAST_IP_FILE="/tmp/last_ip.txt"

if [ -z "$IP" ]; then
    exit 0
fi

if [ -f "$LAST_IP_FILE" ]; then
    OLD_IP=$(cat "$LAST_IP_FILE")
else
    OLD_IP=""
fi

if [ "$IP" == "$OLD_IP" ]; then
    exit 0
fi

curl https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$DNS_RECORD_ID \
    -X PATCH \
    -H 'Content-Type: application/json' \
    -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
    -d '{
          "content": "'"$IP"'"
        }'

echo "$IP" > "$LAST_IP_FILE"

#Here we are only updating the content of the record, its easy to add more and then just make a variable.
#For example you could add

#DATE="$(date)"
#And then update the http api request to ...    

#-d '{
#  "content": "'"$IP"'",
#  "comment": "'"$DATE"'"
#  }'

#That would add as a record comment the current date and time of the script execution.
#You can add a bunch of other stuff, please check "https://developers.cloudflare.com/api/resources/dns/subresources/records/methods/update"
