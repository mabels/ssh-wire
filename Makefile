.PHONY: build
.PHONY: frameworks

CWD := $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

#$(CWD)/build.sh
build:
	cargo test
	rustup target add aarch64-apple-ios  x86_64-apple-ios
	rustup target add arm-linux-androideabi
	rustup target add armv7-linux-androideabi
	rustup target add aarch64-linux-android
	cargo lipo --release --verbose

frameworks:
	$(CWD)/scripts/create-frameworks.sh

all: build frameworks
