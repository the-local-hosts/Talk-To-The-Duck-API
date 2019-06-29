#!/bin/bash
API="http://localhost:4741"
URL_PATH="/blogposts"
SECOND_PATH="/comments"
POST_ID="5d16711d7dd66b208806767b"
COMMENT_ID="5d16e790f7322e3874fae6ae"
TOKEN="e0da66d88046ad9994bea78df1a40b63"


curl "${API}${URL_PATH}/${POST_ID}${SECOND_PATH}/${COMMENT_ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": "'"Yey"'"
  }'

echo
