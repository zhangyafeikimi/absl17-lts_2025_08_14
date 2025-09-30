#! /bin/bash
#

set -e
cd $(dirname $0)

find absl -type f | xargs dos2unix -q
find absl -type f | xargs sed -i 's/[ \t]*$//'
find absl -name "*.h" -o -name "*.cc" -o -name "*.c" -o -name "*.inc" | xargs clang-format -i
find absl -name BUILD.bazel -o -name "*.bzl" | xargs buildifier
buildifier WORKSPACE.bazel
