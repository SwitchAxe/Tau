SCHEME = /usr/bin/chez

CHEZVERSION = $(shell $(SCHEME) --version 2>&1)

FFICFUNCTIONSPATH = src/lib/
MAINSSPATH = src/main.ss
COMPILEFLAGS = -Wall -Werror -lxcb -shared -fPIC
.PHONY: build_shared_objects exec
exec:
	chez -q $(MAINSSPATH)
build_shared_objects:
	gcc ${COMPILEFLAGS} $(FFICFUNCTIONSPATH)/ffi_funcs.c -o ffi_funcs.so
	mv ffi_funcs.so ${FFICFUNCTIONSPATH}
