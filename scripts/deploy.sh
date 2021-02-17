#!/bin/bash
#
# Tests meant to be run on Circle CI.
#
set -e

docker-compose up -d
echo "=>"
echo "=> You can visit your site at:"
echo "=> http://"$(docker-compose port server 80)
echo "=>"
