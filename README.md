# Better-DDNS-Script
This is a better DDNS script, replacing my old "Simple DDNS Script".
Thats helpful a lot when u dont have a static ip.

On the script itself there are instructions.
⬇️Other helpful information⬇️
How to get the RECORD_ID for your A record.
`curl -s -X GET "https://api.cloudflare.com/client/v4/zones/YOUR_ZONE_ID/dns_records?type=A" -H "Authorization: Bearer YOUR_API_TOKEN" -H "Content-Type: application/json" | jq -r '.result[] | "\(.name) => \(.id)"'`

It should give output in your bash like this.

text.lol => (Zone Id) aaa.text.lol => (Zone Id) bbb.text.lol => (Zone Id)

TIP: Automate this script with cronjob so you don't have to manually run it everytime!

Notice: This is made to work with Cloudflare API TOKKENs, not with Cloudflare Global API Key.
All you need to do is make an Edit zone dns tokken, with the permission of `Zone.DNS`, also make sure you make it read/write instead of read only. 

Any other questions? Add me on discord, "coolatlantis"!
