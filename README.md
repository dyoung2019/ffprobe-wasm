# `FFProbe Wasm`
> A Web-based FFProbe. Powered by FFmpeg, Vue and Web Assembly!

## With **multi-threading disabled** fork

### __No pthreads__ therefore should be compatible with all(more) browsers.

~~⚠️ ️Compatible with Chrome and Edge only due to limited support for [SharedArrayBuffer](https://caniuse.com/sharedarraybuffer) and the [required CORS headers](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer) for Firefox on Github Pages.~~

## Library files (v0.5.0)

- no pthreads 
  - ffprobe.js
  - ffprobe.wasm

- legacy
  - ffprobe-wasm.js
  - ffprobe-wasm.wasm
  - ffprobe-wasm.worker.js

- no pthreads / es6 module
  - ffprobe-es6.mjs
  - ffprobe-es6.wasm

### TL;DNR Setup

```bash
git clone https://github.com/dyoung2019/ffprobe-wasm.git
docker build ffprobe-wasm/
cd ffprobe-wasm/
docker-compose run ffprobe-wasm make
```

### Credits 
- emscripten docker image 2.0.18
- ffmpeg 4.4
- x264 version 20191217-2245-stable

## Development
`ffprobe-wasm` uses [emscripten](https://emscripten.org/) to compile [FFmpeg](https://ffmpeg.org)'s [libav](https://ffmpeg.org/doxygen/4.1/index.html) to [Web Assembly](https://webassembly.org/) via [Docker](https://www.docker.com/).

Emscripten is also used to create and compile the Wasm bindings to be imported by the browser.

### Requirements
* `nodejs` - https://nodejs.org/en/download/
* `docker` - https://docs.docker.com/desktop/

### Setup 
* Clone project and build the Wasm module via Docker:
```
docker-compose run ffprobe-wasm make
```

This will build the Wasm module and place it into the `/dist` directory.

* Copy the JS and Wasm modules into `www/public/`:
```
cp -a dist/. www/public/
```

* Install and run the web application:
```
cd www
npm install
npm run serve
```

* Load `http://localhost:8080/` in the web browser.

### Compiles and minifies for production
```
npm run build
```

### Deploy
Deploys to [Github Pages](https://pages.github.com/)
```
npm run deploy
```

### Resources
* https://ffmpeg.org/doxygen/4.1/index.html
* https://emscripten.org/
* https://vuejs.org
* https://bootstrap-vue.org

## License
MIT
