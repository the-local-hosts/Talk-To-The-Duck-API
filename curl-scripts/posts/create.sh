#!/bin/bash
TITLE="awesome title"
POSTBODY="awesome post body"

API="http://localhost:4741"
URL_PATH="/blogposts"
TOKEN="da21c0912b08018ef23b928f3340dfea"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Bearer ${TOKEN}" \
  --data '{
    "blogpost": {
      "title": "'"${TITLE}"'",
      "postBody": "'"${POSTBODY}"'"
    }
  }'

echo
