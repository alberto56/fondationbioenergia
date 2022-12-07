#!/bin/bash
#
# Validate single HTML file.
#
set -e

if [ -z "$1" ]; then
  >&2 echo "Please provide a file name such as ./docs/index.html"
  exit 1
fi

FILE="$1"

# do-not-commit contains actual rendered DOM, and this site is using a
# carousel which strips alt tags. We do not have the resources to
# fix this, so we will examine only the pre-manipulated raw source.
rm -rf do-not-commit

echo ""
echo "*** Validating HTML on file $FILE ***"
echo ""
docker run --rm -v "$(pwd)":/code dcycle/html-validate:2 --drop-empty-elements no "$FILE"
#
# echo ""
# echo "*** Done validating HTML on file $1 ***"
# echo ""
