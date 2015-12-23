#!/usr/bin/env bash

PATH=$PATH:./node_modules/.bin

BOWER=bower
BROWSERIFY=browserify

[ -d www/lib ] && rm -rf www/lib/*
[ ! -d www/lib ] && mkdir www/lib

$BOWER install jquery
mkdir -p www/lib/jquery && cp bower_components/jquery/dist/jquery.js www/lib/jquery

# $BOWER install aws-sdk-js
# mkdir -p www/lib/aws-sdk && cp bower_components/aws-sdk/dist/aws-sdk.js www/lib/aws-sdk

$BROWSERIFY www/src/index.js --debug \
    --transform [ babelify --presets [ react ] ] \
    --plugin [minifyify --map www/lib/index-bundle.map.json --output www/lib/index-bundle.map.json] \
    --outfile www/lib/index-bundle.js
