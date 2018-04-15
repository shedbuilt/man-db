#!/bin/bash
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.2 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/elinks       \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap && \
make -j $SHED_NUM_JOBS && \
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
sed -i "s:man man:root root:g" "${SHED_FAKE_ROOT}/usr/lib/tmpfiles.d/man-db.conf"
