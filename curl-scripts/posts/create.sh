#!/bin/bash
TITLE="posto new"
POSTBODY="please work!!!"

API="http://localhost:4741"
URL_PATH="/blogposts"
TOKEN="734a1703a9d09ac1761d91bbedf3cda9"

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
