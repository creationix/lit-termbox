LUAJIT_OS=$(shell luajit -e "print(require('ffi').os)")
LUAJIT_ARCH=$(shell luajit -e "print(require('ffi').arch)")
TARGET_DIR=$(LUAJIT_OS)-$(LUAJIT_ARCH)/

ifeq ($(LUAJIT_OS), OSX)
TERMBOX_LIB=libtermbox.dylib
endif
ifeq ($(LUAJIT_OS), Linux)
TERMBOX_LIB=libtermbox.so
endif

libs: build
	cmake --build build --config Release
	mkdir -p $(TARGET_DIR)
	cp build/$(TERMBOX_LIB) $(TARGET_DIR)

termbox/src:
	git submodule update --init termbox

build: termbox/src
	cmake -Bbuild -H. -GNinja

test: build
	LUVI_APP=test-app lit

clean:
	rm -rf build
