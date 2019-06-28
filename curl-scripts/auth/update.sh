#!/bin/bash

API="http://localhost:4741"
URL_PATH="/users/"
URL=https://hishamovski.s3.amazonaws.com/7355179976036201

curl "${API}${URL_PATH}/" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "user": {
      "url": "'"${URL}"'"
    }
  }'

echo
