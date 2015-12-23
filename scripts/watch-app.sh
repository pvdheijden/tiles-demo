#!/usr/bin/env bash

PATH=$PATH:./node_modules/.bin

BROWSERIFY=watchify

[ ! -d www/lib  ] && mkdir www/lib

$BROWSERIFY www/src/index.js --debug \
    --transform [ babelify --presets [ react ] ] \
    --outfile www/lib/index-bundle.js -v
