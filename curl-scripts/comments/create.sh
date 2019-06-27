#!/bin/bash

API="http://localhost:4741"
URL_PATH="/comments"
TOKEN="b5991e9ef885af3ae4932ad1ea56c163"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": {
      "comment": "'"${COMMENT}"'",
      "blogpost": "'"${BLOGPOST}"'"
    }
  }'

echo
