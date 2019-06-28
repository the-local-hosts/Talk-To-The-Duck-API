#!/bin/bash

API="http://localhost:4741/blogposts/"
POST_ID="5d157da1c6f65267b0160c3f"
TOKEN="523dff1540210541c5ce95d3b0a229c4"

curl "${API}${URL_PATH}${POST_ID}/comments" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": "'"Second Comment"'"
  }'

echo
