#!/usr/bin/env bash

prepare_parts() {
# make all parts executable - to accommodate Windows host systems
# execute this function before calling run-parts
    local parts_dir=$1
    if [ -d $parts_dir ] ; then
        touch $parts_dir/.ignore
        chmod +x `find $parts_dir -type f`
        rm -f $parts_dir/.ignore
    fi
}
