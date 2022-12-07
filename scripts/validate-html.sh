#!/bin/bash
#
# Validate all HTML files.
#
set -e

echo ""
echo "Validating HTML using"
echo "https://github.com/dcycle/docker-html-validate"
echo ""
echo "** If this fails, please run ./scripts/deploy.sh first! **"
echo ""
# only checking ./docs/_site, not ./do-not-commit/dom-captures, because
# do-not-commit contains actual rendered DOM, and this site is using a
# carousel which strips alt tags. We do not have the resources to
# fix this, so we will examine only the pre-manipulated raw source.
for root in ./docs/_site; do
  for i in $(find "$root" -name *.html); do
    ./scripts/validate-html-file.sh "$i"
  done
done
echo ""
echo "Done validating HTML!"
echo ""
