#!/bin/bash
TOKEN="375cd1679a739bf0bf7b05647cc84990"
API="http://localhost:4741/"
URL_PATH="blogpost"
SECOND_URL="likes"
POST_ID="5d18117d2ebfa11fae026bd3"
TOKEN="efdfc891987eab539c1287410c16ffa0"


curl "${API}${URL_PATH}/${POST_ID}/${SECOND_URL}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \

echo
