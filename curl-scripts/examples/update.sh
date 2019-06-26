#!/bin/bash
TOKEN="734a1703a9d09ac1761d91bbedf3cda9"
API="http://localhost:4741"
URL_PATH="/blogposts"
TITLE="This title is so much better!"
ID="5d13c681a42036e8e4e86ddd"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "blogpost": {
      "title": "'"${TITLE}"'"
    }
  }'

echo
