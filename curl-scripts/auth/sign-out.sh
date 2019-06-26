#!/bin/bash

TOKEN="06e9617608f89ae2d8d2e999085bc8ce"
API="http://localhost:4741"
URL_PATH="/sign-out"

curl "${API}${URL_PATH}/" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
