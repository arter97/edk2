#!/bin/bash

set -e
. ./edksetup.sh
make -C /home/arter97/edk2/BaseTools/Source/C -j64
build -a X64 \
    -t GCC49 \
    -p OvmfPkg/OvmfPkgX64.dsc \
    -DNETWORK_HTTP_BOOT_ENABLE=TRUE -DSECURE_BOOT_ENABLE=TRUE -DFD_SIZE_2MB -DTPM2_ENABLE=TRUE -b RELEASE
ls -al Build/OvmfX64/RELEASE_GCC49/FV/OVMF_*.fd
