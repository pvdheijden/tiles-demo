#!/usr/bin/env bash

PATH=$PATH:./node_modules/.bin

[ ! -d www/lib  ] && mkdir www/lib

browserify www/src/index.js --debug \
    --transform [ babelify --presets [ react ] ] \
    --plugin [minifyify --map www/lib/index-bundle.map.json --output www/lib/index-bundle.map.json] \
    --outfile www/lib/index-bundle.min.js
