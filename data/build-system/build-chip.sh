#!/bin/bash

EXTRA_MAKE_ARGS=""
if [ -f "config/environment.conf" ]; then
	source "config/environment.conf"
fi

if [ -n "$LINUX_BRANCH" ]; then
	EXTRA_MAKE_ARGS+="-e LINUX_VERSION=\"$LINUX_BRANCH\""
fi
#echo ${EXTRA_MAKE_ARGS}
#exit 1
pushd components/
if [ ! -d buildroot ]; then
	git clone -b nextthing/chip-nand https://github.com/NextThingCo/CHIP-buildroot.git buildroot
fi
popd
make chip_defconfig
make
BUILDROOT_OUTPUT_DIR=output ./make-flashable-image erase-bb
cp output/images/* /chip-sdk/build
