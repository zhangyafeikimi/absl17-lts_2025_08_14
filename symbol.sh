#! /bin/bash
#

set -e
cd $(dirname $0)

LIBS=$(find -L bazel-bin -type f -name "*.a" | sort)
for lib in $LIBS; do
    nm $lib | grep -v " U " | grep " [A-Za-z] " | c++filt
done

# Symbols we want to rename to avoid conflictions:
#
# absl::*
#
# Absl*
#
# FLAGS_flagfile
# FLAGS_noflagfile
# FLAGS_fromenv
# FLAGS_nofromenv
# FLAGS_tryfromenv
# FLAGS_notryfromenv
# FLAGS_undefok
# FLAGS_noundefok
#
# FLAGS_help
# FLAGS_helpfull
# FLAGS_helpmatch
# FLAGS_helpon
# FLAGS_helppackage
# FLAGS_helpshort
# FLAGS_only_check_args
# FLAGS_version
