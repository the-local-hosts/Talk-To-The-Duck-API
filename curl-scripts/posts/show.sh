#!/bin/sh
ID=5d139ed40abc360463a5e370

API="http://localhost:4741"
URL_PATH="/blogposts"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \

echo
