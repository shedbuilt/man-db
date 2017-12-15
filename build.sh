#!/bin/bash
./configure --prefix=/usr                        \
            --docdir=/usr/share/doc/man-db-2.7.6.1 \
            --sysconfdir=/etc                    \
            --disable-setuid                     \
            --enable-cache-owner=bin             \
            --with-browser=/usr/bin/lynx         \
            --with-vgrind=/usr/bin/vgrind        \
            --with-grap=/usr/bin/grap
make -j $SHED_NUMJOBS
make DESTDIR=${SHED_FAKEROOT} install
sed -i "s:man man:root root:g" ${SHED_FAKEROOT}/usr/lib/tmpfiles.d/man-db.conf
