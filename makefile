SCHEME = scheme

CHEZVERSION = $(shell $(SCHEME) --version 2>&1)

OBJPATH = objects/
MAINSSPATH = src/main.ss
.PHONY: all build_shared_objects exec clean
all: build_shared_objects bindings

exec:
	scheme -q $(MAINSSPATH)
build_shared_objects:
	mkdir -p $(OBJPATH)
	scheme -q compile_lib.ss
	mv src/lib/*.so $(OBJPATH)

bindings:
	$(SCHEME) --libdirs $(shell realpath $(OBJPATH)) \
	generate_bindings.ss > debug.txt

clean:
	rm -rf $(OBJPATH)
	rm debug.txt
