#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_DOCDIR="/usr/share/doc/${SHED_PKG_NAME}-${SHED_PKG_VERSION}"
# Configure
./configure --prefix=/usr                        \
            --docdir=$SHED_PKG_LOCAL_DOCDIR      \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/elinks       \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
# Optionally Remove Documentation
if [ -z "${SHED_PKG_LOCAL_OPTIONS[docs]}" ]; then
    rm -rf "${SHED_FAKE_ROOT}/usr/share/doc"
fi
