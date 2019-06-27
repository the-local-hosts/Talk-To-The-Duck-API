#!/bin/bash
TITLE="Kevin's Post"
POSTBODY="Something"

API="http://localhost:4741"
URL_PATH="/blogposts"
TOKEN="6c812a72982397f04e3509b921ef4932"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "blogpost": {
      "title": "'"${TITLE}"'",
      "postBody": "'"${POSTBODY}"'"
    }
  }'

echo
