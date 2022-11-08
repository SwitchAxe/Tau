SCHEME = /usr/bin/scheme

CHEZVERSION = $(shell $(SCHEME) --version 2>&1)

OBJPATH = objects/
MAINSSPATH = src/main.ss
COMPILEFLAGS = -Wall -Werror -lxcb -shared -fPIC
.PHONY: all build_shared_objects exec
all: build_shared_objects

exec:
	scheme -q $(MAINSSPATH)
build_shared_objects:
	rm -rf objects
	mkdir objects
	scheme -q compile_lib.ss
	mv src/lib/*.so ${OBJPATH}
