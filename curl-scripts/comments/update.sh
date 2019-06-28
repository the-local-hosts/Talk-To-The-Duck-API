#!/bin/bash
API="http://localhost:4741"
URL_PATH="/blogposts"
SECOND_PATH="/comments"
POST_ID="5d165624cf249e1c1b178212"
COMMENT_ID="5d16564ccf249e1c1b178213"
TOKEN="020b94daba41154020064aa3a11519d2"


curl "${API}${URL_PATH}/${POST_ID}${SECOND_PATH}/${COMMENT_ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "comment": "'"Update"'"
  }'

echo
