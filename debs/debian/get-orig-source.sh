#!/bin/bash

set -ex

PKG="${1}"
VERSION="${2}"
ZIPFILE="${PKG}-${VERSION}.zip"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.xz"

[ ! -f "${ORIG_TARBALL}" ] || exit 0

SHA=$(echo "${VERSION}" | awk -F'~' '{print $2}')
VER=$(echo "${VERSION}" | awk -F'+' '{print $1}')

rm -rf "${PKG}"*
rm -rf "${PKG}-${VER}"
rm -f "${ZIPFILE}"

wget -c -t 1 -T 5 "https://github.com/apache/flex-blazeds/archive/${SHA}.zip" -O "${ZIPFILE}" || exit 1

unzip "${ZIPFILE}" || exit 1

rm -f "${ZIPFILE}"

mv "${PKG}"* "${PKG}-${VER}"

find "${PKG}-${VER}" -type f -name '.classpath' -exec rm -f '{}' \;
find "${PKG}-${VER}" -type f -name '.project' -exec rm -f '{}' \;

rm -rf "${PKG}-${VER}/opt/tomcat/tomcat-4"
rm -rf "${PKG}-${VER}/opt/tomcat/tomcat-6"
rm -rf "${PKG}-${VER}/attic"
rm -rf "${PKG}-${VER}/examples"
rm -rf "${PKG}-${VER}/testsuite"

tar -cJf "${ORIG_TARBALL}" --exclude-vcs "${PKG}-${VER}" || exit 1

rm -rf "${PKG}-${VER}"
rm -f "${ZIPFILE}"

