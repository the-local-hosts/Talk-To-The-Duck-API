#!/bin/bash

API="http://localhost:4741/blogposts/"
POST_ID="5d165c6ac5cda01df24ff37c"
TOKEN="020b94daba41154020064aa3a11519d2"

curl "${API}${URL_PATH}${POST_ID}/comments" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": "'"Another comment"'"
  }'

echo
