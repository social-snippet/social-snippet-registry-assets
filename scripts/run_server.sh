#!/bin/sh

SSPM_WEBAPI_HOST=localhost:19292 gulp build

# http://localhost:19292
SSPM_ASSETS_HOST="http://localhost:19292" SSPM_DEBUG="true" bundle exec rackup --host localhost --port 19292
