#!/bin/bash
TOKEN="b5991e9ef885af3ae4932ad1ea56c163"
API="http://localhost:4741"
URL_PATH="/comments"
COMMENT="This comment is so much better!"
ID="5d14d09c2d86552fd24e0bde"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "comment": {
      "comment": "'"${COMMENT}"'"
    }
  }'

echo
