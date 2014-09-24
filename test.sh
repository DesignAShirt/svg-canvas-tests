#!/bin/bash

# https://github.com/karma-runner/karma-sauce-launcher/issues/40#issuecomment-48337578

. creds

test() {
 ./node_modules/karma/bin/karma start
}

if [ -n "$SAUCE_USERNAME" ] && [ -n "$SAUCE_ACCESS_KEY" ]; then
  # KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='11'   PLATFORM='Windows 8.1'   test;
  # KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='11'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='10'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='9'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='internet explorer'   VERSION='8'   PLATFORM='Windows 7'   test;

  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='b'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='37'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='36'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='35'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='34'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='33'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='32'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='31'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='30'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='29'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='28'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='27'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='26'   PLATFORM='Windows 7'   test;

  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='32'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='31'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='30'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='29'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='28'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='27'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='26'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='25'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='24'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='23'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='22'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='21'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='20'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='19'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='18'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='17'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='16'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='15'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='14'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='13'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='12'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='11'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='10'   PLATFORM='Windows 7'   test;

  KARMA_SAUCE='yes' BROWSER='opera'   VERSION='12'   PLATFORM='Windows 7'   test;
  KARMA_SAUCE='yes' BROWSER='opera'   VERSION='11'   PLATFORM='Windows 7'   test;

  KARMA_SAUCE='yes' BROWSER='firefox'   VERSION='32'   PLATFORM='Linux'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'   VERSION='36'   PLATFORM='Linux'   test;

  KARMA_SAUCE='yes' BROWSER='firefox'             VERSION='32'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='chrome'             VERSION='36'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='7'   PLATFORM='OS X 10.9'   test;

  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='6'   PLATFORM='OS X 10.8'   test;

  KARMA_SAUCE='yes' BROWSER='safari'             VERSION='5'   PLATFORM='OS X 10.6'   test;

  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='7.1'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='7.0'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='6.1'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='6.0'   PLATFORM='OS X 10.9'   test;
  KARMA_SAUCE='yes' BROWSER='ipad'             VERSION='5.1'   PLATFORM='OS X 10.9'   test;

  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.4'   PLATFORM='Linux'   test;
  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.3'   PLATFORM='Linux'   test;
  KARMA_SAUCE='yes' BROWSER='android'             VERSION='4.2'   PLATFORM='Linux'   test
else
  KARMA_SAUCE='no' test
fi
