#!/bin/bash

API="http://localhost:4741/blogposts/"
POST_ID="5d16711d7dd66b208806767b"
TOKEN="e0da66d88046ad9994bea78df1a40b63"

curl "${API}${URL_PATH}${POST_ID}/comments" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": "'"Comment"'"
  }'

echo
