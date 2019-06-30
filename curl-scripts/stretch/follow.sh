#!/bin/bash
TOKEN="375cd1679a739bf0bf7b05647cc84990"
API="http://localhost:4741/"
URL_PATH="follow"
USERID="5d1579933a861466b385c58a"
TOKEN="020b94daba41154020064aa3a11519d2"


curl "${API}${URL_PATH}/${USERID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \

echo
