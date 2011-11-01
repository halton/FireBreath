#!/bin/bash

if [ "${GEN}" = "" ]; then
    GEN='Unix Makefiles'
fi

for ARG in "$@"
do
    if [ "$ARG" = "-DFB_SHARED=1" ]; then
        use_libfirebreath="1"
    fi
done

source ${0%/*}/common.sh "$@"

pushd "$BUILDDIR"
cmake -G "$GEN" -DFB_PROJECTS_DIR="${PROJDIR}" "$@" "${FB_ROOT}"
popd
