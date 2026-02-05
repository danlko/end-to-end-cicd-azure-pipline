#!/bin/bash

URL=${1:-"http://3.239.116.53:5000/"}

echo "Health checking..."


for i in {1..10}; do
  echo attempt $i

  STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

  if [ "$STATUS_CODE" -eq 200 ]; then
    echo "SUCCESS! status code is $STATUS_CODE"
    exit 0
  elif [ "$STATUS_CODE" -eq 000 ]; then
    echo "Lost connection"
  else
    echo "FAILED! status code is $STATUS_CODE"
    exit 1
  fi

  sleep 5
done

echo "Server failed. it did not start after 10 attempts"
exit 1


