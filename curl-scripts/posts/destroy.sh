#!/bin/bash

API="http://localhost:4741"
URL_PATH="/blogposts"
ID="5d13b3950f6c020757dc3f2c"
TOKEN="dcef98931e5babd3a9cffebcac9730a4"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \

echo
