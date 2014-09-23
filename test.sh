#!/bin/bash

# https://github.com/karma-runner/karma-sauce-launcher/issues/40#issuecomment-48337578

. creds

test() {
 ./node_modules/karma/bin/karma start
}

if [ -n "$SAUCE_USERNAME" ] && [ -n "$SAUCE_ACCESS_KEY" ]; then
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='11'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='10'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='9'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='8'   PLATFORM='Windows 7'   test &&

  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='b'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='37'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='36'   PLATFORM='Windows 7'   test &&

  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='32'   PLATFORM='Windows 7'   test &&
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='31'   PLATFORM='Windows 7'   test &&

  KARMA_SAUCE='yes' BROWSER='opera'   VERSION='12'   PLATFORM='Windows 7'   test &&

  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='32'   PLATFORM='Linux'   test &&
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='36'   PLATFORM='Linux'   test &&

  KARMA_SAUCE='yes' BROWSER='firefox'             VERSION='32'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='chrome'             VERSION='36'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='7'   PLATFORM='OS X 10.9'   test &&

  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='6'   PLATFORM='OS X 10.8'   test &&

  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='5'   PLATFORM='OS X 10.6'   test &&

  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='7.1'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='7.0'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='6.1'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='6.0'   PLATFORM='OS X 10.9'   test &&
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='5.1'   PLATFORM='OS X 10.9'   test &&

  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.4'   PLATFORM='Linux'   test &&
  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.3'   PLATFORM='Linux'   test &&
  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.2'   PLATFORM='Linux'   test

else
  KARMA_SAUCE='no' test
fi
