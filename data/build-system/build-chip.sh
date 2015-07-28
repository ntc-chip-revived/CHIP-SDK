#!/bin/bash
pushd components/
git clone -b nextthing/chip-nand https://github.com/NextThingCo/CHIP-buildroot.git buildroot
popd
make chip_defconfig
make
cp output/images/* /chip-sdk/build
