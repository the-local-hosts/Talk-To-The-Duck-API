#!/bin/bash

API="http://localhost:4741"
URL_PATH="/blogposts"
SECOND_PATH="/comments"
POST_ID="5d164113dc3aad161cf57b94"
COMMENT_ID="5d164c3bc39773186b0f3648"
TOKEN="020b94daba41154020064aa3a11519d2"

curl "${API}${URL_PATH}/${POST_ID}${SECOND_PATH}/${COMMENT_ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \

echo
