#!/bin/bash
TOKEN="375cd1679a739bf0bf7b05647cc84990"
API="http://localhost:4741/"
URL_PATH="blogpost"
SECOND_URL="likes"
POST_ID="5d18117d2ebfa11fae026bd3"
COMMENT_ID="5d18156ccd14ff20bfdfb0ed"
TOKEN="a4a796cb11a751d5a3003a362be6159f"


curl "${API}${URL_PATH}/${POST_ID}/${SECOND_URL}/${COMMENT_ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \

echo
