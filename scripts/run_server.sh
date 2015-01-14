#!/bin/sh

export SSPM_WEBAPI_HOST=localhost:19292
export SSPM_ASSETS_HOST=http://localhost:19292
export SSPM_DEBUG="true"

gulp build
bundle exec rackup --host localhost --port 19292
