#!/bin/bash
TITLE="posto new"
POSTBODY="please work!!!"

API="http://localhost:4741"
URL_PATH="/blogposts"
TOKEN="dcef98931e5babd3a9cffebcac9730a4"

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
