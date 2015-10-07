#!/bin/sh

. .slack_info

WEBMESSAGE=`cat -`
curl -s -S -X POST \
  --data-urlencode "payload={\"channel\": \"${CHANNEL}\", \"username\": \"${BOTNAME}\", \"icon_emoji\": \"${FACEICON}\", \"text\": \"${WEBMESSAGE}\" }" ${WEBHOOKURL} \
  >/dev/null
