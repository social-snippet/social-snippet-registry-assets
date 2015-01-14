#!/bin/sh

export SSPM_WEBAPI_HOST=localhost:19292
export SSPM_ASSETS_HOST=http://localhost:19292
export SSPM_DEBUG="true"
export SSPM_LOCAL_STORAGE="true"

[ $SSPM_WEBPACK_DEV_SERVER == "" ] && gulp build
bundle exec rackup --host localhost --port 19292
