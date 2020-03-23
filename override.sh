#!/bin/bash

build () {
    cargo install cbindgen
    cargo install sccache
    ./mach build
}

stage() {
    /root/parts/waterfox/build/mach install
    cp -r /root/parts/waterfox/install/* /root/stage
    mkdir -p /root/stage/usr/lib/waterfox
    cp -r /usr/local/lib/waterfox /root/stage/usr/lib/
    ln -sf /root/stage/usr/lib/waterfox/waterfox /root/stage/usr/bin/waterfox
    snapcraftctl stage
}

prime() {
    cp -r /usr/local/lib/waterfox /root/prime/usr/lib/
    ln -sf /root/prime/usr/lib/waterfox/waterfox /root/prime/usr/bin/waterfox
    snapcraftctl prime
}

"$@"
