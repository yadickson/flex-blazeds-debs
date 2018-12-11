#!/bin/bash

set -ex

PKG="${PACKAGE_NAME:-${1}}"
VERSION="${PACKAGE_VERSION:-${2}}"
ORIG_TARBALL="../${PKG}_${VERSION}.orig.tar.gz"

[ -f "${ORIG_TARBALL}" ] || exit 1

VERSION=$(echo "${VERSION}" | awk -F'+' '{print $1}')

rm -rf .pc target build
rm -rf pom.xml* opt proxy remoting core common assembly flex*
rm -f LICENSE
rm -f NOTICE
rm -f README
rm -f RELEASE_NOTES

tar --strip-components=1 -xzf "${ORIG_TARBALL}" "${PKG}-${VERSION}" || exit 1

