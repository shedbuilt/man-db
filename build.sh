#!/bin/bash
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.8.2 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/elinks       \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap && \
make -j $SHED_NUMJOBS && \
make DESTDIR="$SHED_FAKEROOT" install || exit 1
sed -i "s:man man:root root:g" "${SHED_FAKEROOT}/usr/lib/tmpfiles.d/man-db.conf"
