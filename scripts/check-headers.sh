# This script ensures that pages in the production build of the site don't contain
# the X-Robots-Tag: noindex header, which causes them to be unindexed by Google
# search. Only non-production builds should have this header.

#!/bin/bash

if grep -q "noindex" public/_headers; then
  echo 'FAIL: The _headers file improperly contains the "X-Robots-Tag: noindex" header in the production environment'
  exit 1
else
  echo 'INFO: The _headers file contains the "X-Robots-Tag: noindex" header as expected in non-production environments'
  exit 0
fi
