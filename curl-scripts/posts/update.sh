#!/bin/bash
TOKEN="375cd1679a739bf0bf7b05647cc84990"
API="http://localhost:4741"
URL_PATH="/blogposts"
TITLE="Kevin in Kevin's"
ID="5d151633008e541dfbd1dfd1"


curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "blogpost": {
      "comment": {"text": "'"${TITLE}"'"}
    }
  }'

echo
