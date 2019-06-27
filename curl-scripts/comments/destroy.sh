#!/bin/bash

API="http://localhost:4741"
URL_PATH="/comments"
ID="5d14d09a2d86552fd24e0bdd"
TOKEN="b5991e9ef885af3ae4932ad1ea56c163"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \

echo
