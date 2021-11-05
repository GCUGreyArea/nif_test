UNAME = $(shell uname)


REBAR = /Users/barry.robinson/.cache/rebar3/bin/rebar3

ifeq ($(UNAME), Darwin)
	ADDRSAN=/Library/Developer/CommandLineTools/usr/lib/clang/13.0.0/lib/darwin/libclang_rt.asan_osx_dynamic.dylib
	ASAN_OPTIONS=log_path=asan.log
	PRELOAD_LIB=DYLD_INSERT_LIBRARIES $(ADDRSAN)
else ifeq ($(UNAME), Linux)
	ADDRSAN=ADDRSAN=/usr/lib/gcc/x86_64-linux-gnu/7/libasan.so
	PRELOAD_LIB=LD_PRELOAD $(ADDRSAN)
	ASAN_OPTIONS=detect_leaks=1:log_path=asan.log
endif

all: compile

unit: compile
	@echo "Running sanitized eunit:test(search_lib_filter)..."
	erl \
	-noshell \
	-env ASAN_OPTIONS $(ASAN_OPTIONS) \
	-env $(PRELOAD_LIB) \
	-pa ebin \
	-pa _build/test/lib/*/ebin _build/test/lib/*/test \
	-eval "eunit:test(libalalgo_filter)" \
	-eval "init:stop()"

sanitize-shell: compile
	@echo "Starting sanitized erl shell..."
	erl \
	-env ASAN_OPTIONS $(ASAN_OPTIONS) \
	-env $(PRELOAD_LIB) \
	-pa ebin \
	-pa _build/default/lib/nif_test/ebin \

shell:
# 	-pa _build/nif_test/src
#	@echo "Starting sanitized erl shell..."
#	erl -env ASAN_OPTIONS log_path=asan.log \
#	-env DYLD_INSERT_LIBRARIES /Library/Developer/CommandLineTools/usr/lib/clang/13.0.0/lib/darwin/libclang_rt.asan_osx_dynamic.dylib \
#	-pa ebin -pa `pwd`/_build/test/lib/*/ebin \
#	-pa `pwd`/_build/test/lib/*/test

compile:
	$(REBAR) clean
	$(REBAR) compile


clean: 
	$(REBAR) clean
