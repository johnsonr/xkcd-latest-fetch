#!/bin/bash
# Fetch the latest XKCD comic metadata and image URL

API_URL="https://xkcd.com/info.0.json"

echo "Fetching latest XKCD comic..."
DATA=$(curl -s "$API_URL")

if [ -z "$DATA" ]; then
  echo "Error: Failed to fetch data from XKCD API" >&2
  exit 1
fi

NUM=$(echo "$DATA" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['num'])")
TITLE=$(echo "$DATA" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['title'])")
IMG=$(echo "$DATA" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['img'])")
ALT=$(echo "$DATA" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['alt'])")
DATE=$(echo "$DATA" | python3 -c "import sys,json; d=json.load(sys.stdin); print(f\"{d['year']}-{d['month'].zfill(2)}-{d['day'].zfill(2)}\")")

echo ""
echo "Comic #:    $NUM"
echo "Title:      $TITLE"
echo "Date:       $DATE"
echo "Image URL:  $IMG"
echo "Alt text:   $ALT"
