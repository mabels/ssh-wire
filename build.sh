#!/bin/sh

#set -euo pipefail

# Build the rust project.
cargo test

#RUSTFLAGS="-C llvm-args=\"-fembed-bitcode\"" cargo lipo --release --verbose
#BITCODE_GENERATION_MODE=bitcode cargo lipo --release --verbose
#cargo lipo --release --verbose

if [ ${ANDROID_NDK:-"-"} = "-" ]; then
	echo "ANDROID_NDK unset, skipping android compilation";
else

	#/Users/menabe/Library/Android/sdk/ndk/24.0.8215888//
	export ANDROID_NDK_BIN=$ANDROID_NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin
	CXX=$ANDROID_NDK_BIN/armv7a-linux-androideabi23-clang++ CC=$ANDROID_NDK_BIN/armv7a-linux-androideabi23-clang AR=$ANDROID_NDK_BIN/llvm-ar cargo build  --target armv7-linux-androideabi  --release

	CXX=$ANDROID_NDK_BIN/i686-linux-android23-clang++ CC=$ANDROID_NDK_BIN/i686-linux-android23-clang AR=$ANDROID_NDK_BIN/llvm-ar cargo build --target i686-linux-android --release
	CXX=$ANDROID_NDK_BIN/x86_64-linux-android23-clang++ CC=$ANDROID_NDK_BIN/x86_64-linux-android23-clang AR=$ANDROID_NDK_BIN/llvm-ar cargo build --target x86_64-linux-android --release


	CXX=$ANDROID_NDK_BIN/aarch64-linux-android23-clang++ CC=$ANDROID_NDK_BIN/aarch64-linux-android23-clang AR=$ANDROID_NDK_BIN/llvm-ar cargo build --target aarch64-linux-android --release

#	cargo build --target armv7-linux-androideabi --release
#	cargo build --target i686-linux-android --release
#	cargo build --target x86_64-linux-android --release
#	cargo build --target aarch64-linux-android --release

fi

