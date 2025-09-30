#! /bin/bash
#

set -e
cd $(dirname $0)

LIBS=$(find -L bazel-bin -type f -name "*.a" | sort)
UNAME_S=$(uname -s)
if test $UNAME_S == Linux; then
    g++ -shared -o libabsl17.so \
        -Wl,--whole-archive $LIBS -Wl,--no-whole-archive \
        -pthread \
        -static-libstdc++ -static-libgcc \
        -Wl,--no-undefined
else
    g++ -shared -o libabsl17.dylib \
        -Wl,-all_load $LIBS \
        -pthread -Wl,-framework,CoreFoundation
fi
