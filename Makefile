all: dist dist/ffprobe.js dist/ffprobe-wasm.js dist/ffprobe-es6.mjs

CC_ARGS = --bind -O3 -L/opt/ffmpeg/lib -I/opt/ffmpeg/include/ -s EXTRA_EXPORTED_RUNTIME_METHODS="[FS, cwrap, ccall, getValue, setValue, writeAsciiToMemory]" -s INITIAL_MEMORY=33554432 -lavcodec -lavformat -lavfilter -lavdevice -lswresample -lswscale -lavutil -lm -lx264 -lworkerfs.js

dist:
	mkdir -p dist

dist/ffprobe-wasm.js:
	emcc $(CC_ARGS) \
	-pthread \
	-o dist/ffprobe-wasm.js \
	src/ffprobe-wasm-wrapper.cpp

dist/ffprobe.js:
	emcc $(CC_ARGS) \
	-o dist/ffprobe.js \
	src/ffprobe-wasm-wrapper.cpp

dist/ffprobe-es6.mjs:
	emcc $(CC_ARGS) \
	-o dist/ffprobe-es6.mjs \
	src/ffprobe-wasm-wrapper.cpp