#!/bin/bash

API="http://localhost:4741"
URL_PATH="/books"
TITLE=""
AUTHOR="JRR Tolkien"
TOKEN=4dc383ec85c00debfcfc6a1163354ffe
ID=5d0cf67ed2b65dd7790fd0f2

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
--header "Authorization: Bearer ${TOKEN}" \
--data '{
    "book": {
      "title": "'"${TITLE}"'",
      "author": "'"${AUTHOR}"'"
    }
  }'

echo
