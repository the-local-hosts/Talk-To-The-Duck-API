#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
ID=5d0cf67ed2b65dd7790fd0f0
TOKEN=ac74ac2eab01d7720a7fe59bfc8483df

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Bearer ${TOKEN}" \

echo
