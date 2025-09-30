#! /bin/bash
#

set -e
cd $(dirname $0)

bazel query "deps(//...)" |
    awk '/\/\/absl\/.*\.(h|cc|c|inc)$/{gsub(/:/, "/", $1); print substr($1, 3);}' |
    sort >used
find absl -name "*.h" -o -name "*.cc" -o -name "*.c" -o -name "*.inc" | sort >all
comm -13 used all >unused
