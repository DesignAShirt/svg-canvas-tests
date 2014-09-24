#!/bin/bash

./node_modules/karma/bin/karma start --no-single-run --auto-watch --browsers
echo 'http://localhost:9876/' | pbcopy
echo Copied to clipboard
