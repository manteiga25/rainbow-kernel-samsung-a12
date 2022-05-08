#!/bin/bash

export CROSS_COMPILE=$(pwd)/aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=$(pwd)/arm-linux-gnueabi-
export CROSS_COMPILE_COMPAT=$(pwd)/arm-linux-gnueabi-
export CC=$(pwd)/clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export ARCH=arm64
export SUBARCH=arm64
export HEADER_ARCH=arm64
export ANDROID_MAJOR_VERSION=r

export KCFLAGS=-w
export CONFIG_SECTION_MISMATCH_WARN_ONLY=y

make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y rainbow_defconfig
make -C $(pwd) O=$(pwd)/out KCFLAGS=-w CONFIG_SECTION_MISMATCH_WARN_ONLY=y -j16

cp out/arch/arm64/boot/Image $(pwd)/arch/arm64/boot/Image
