#!/bin/bash

BIN_CURL="/usr/bin/curl -L"
BIN_GIT="/usr/bin/git"
BIN_MV="/bin/mv"
BIN_RM="/bin/rm -rf"
BIN_TAR="/usr/bin/tar"
BIN_UNZIP="/usr/bin/unzip"
BIN_MKDIR="/bin/mkdir"
BIN_CD="cd"

URL_ARCHIVE="http://basercms.net/packages/download/basercms/2.0.5.1"

${BIN_CD} ./contexts/krm/docroot/
${BIN_CURL} -o ./basercms.zip ${URL_ARCHIVE}
${BIN_UNZIP} -q ./basercms.zip
${BIN_RM} ./basercms.zip
${BIN_MV} ./basercms ./public_html

${BIN_MV} ../patch/installations_controller.php ./public_html/baser/controllers/installations_controller.php
${BIN_MV} ../patch/core.php ./public_html/app/config/core.php

## create archive
${BIN_TAR} czpf ../docroot.tar.gz * 
${BIN_CD} ../
${BIN_RM} ./docroot ./patch
${BIN_CD} ../
${BIN_TAR} czpf ./krm.tar.gz ./krm

## end
