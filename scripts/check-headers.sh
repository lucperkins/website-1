# This script ensures that pages in the production build of the site don't contain
# the X-Robots-Tag: noindex header, which causes them to be unindexed by Google
# search. Only non-production builds should have this header.

#!/bin/bash

if grep -q "noindex" public/_headers; then
  echo 'FAIL: The _headers file improperly contains the "X-Robots-Tag: noindex" header'
  exit 1
else
  echo "OK"
  exit 0
fi
