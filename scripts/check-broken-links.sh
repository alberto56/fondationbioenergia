#!/bin/bash
#
# Check for broken links.
#
set -e

source ./config/versioned

docker run --rm \
  --network "$DOCKERNETWORK" \
  dcycle/broken-link-checker:2 http://"$DOCKERNAME" \
  --check-extern \
  --ignore-url "/owlcarousel/"
echo ""
echo "Done checking for broken links!"
echo ""
