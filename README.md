# Godot WebGL Loading Test

![Preview](./preview.png)

[![](https://img.shields.io/github/release-date/JohannesDeml/Godot-WebGL-LoadingTest.svg)](https://github.com/JohannesDeml/Godot-WebGL-LoadingTest/releases) [![Godot 4.3](https://img.shields.io/badge/godot-4.3-green.svg?logo=godot-engine&logoColor=white&cacheSeconds=2592000)](https://godotengine.org/download/archive/4.1.2-stable/)

*Testing Godot's WebGL size and loading times*

* [Overview page of all builds](https://deml.io/experiments/godot-webgl/)
* [Implementation in Unity](https://github.com/JohannesDeml/UnityWebGL-LoadingTest)
* [Godot Forum Thread](https://godotforums.org/d/37304-gzip-brotli-compression-with-custom-template)


## Features

* Responsive template layout
* Rich text console and BBCode parsing
* Commands from the console
* Passing on common browser shortcuts (ctrl+t, F12, ...)
* Automatic CI builds
  * Brotli & Gzip pre-compression
  * wasm-opt (Does not have a relevant effect anymore with Godot 4.3+)


### Release WebGL2
Version | Size | Link
--- | --- | ---
4.4.0 | 6.16 MB | https://deml.io/experiments/godot-webgl/4.4.0-webgl2
4.3.0 | 5.35 MB | https://deml.io/experiments/godot-webgl/4.3.0-webgl2

### Debug WebGL2
Version | Size | Link
--- | --- | ---
4.4.0 | 6.72 MB | https://deml.io/experiments/godot-webgl/4.4.0-webgl2-debug
4.3.0 | 5.81 MB | https://deml.io/experiments/godot-webgl/4.3.0-webgl2-debug

## Platform Compatibility

| Platform   | Chrome | Firefox | Edge | Safari |
| ---------- | :----: | :-----: | :--: | :----: |
| Windows 10 |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| Linux      |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| Mac        |   ✔️    |    ✔️    |  ✔️   |   ✔️    |
| Android    |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| iOS        |   ✔️    |    ✔️    |  ✔️   |   ✔️    |

✔️ *: Supported* | ⚠️ *: Warning , see below* | ❌ *: not supported* | ➖ *: Not applicable*

*This matrix is for Godot 4.4, other versions might differ*

## Notes

* I'm mostly developing with Unity and the comparison to my [unity webgl project](https://github.com/JohannesDeml/UnityWebGL-LoadingTest) might not be fair, since I have a lot more experience there and also fine-tuned it over the last years.
* Exporting the project is a bliss compared to Unity, it is finished in a second while for Unity it takes 10+ minutes on my laptop.
* Loading times are really long for godot (compared to unity)
* I didn't find any way to build for WebGL 1 or WebGPU, if this exists and I just missed it, please let me know.
* I got my hands dirty with custom export templates, but the improvements in 4.1 were not that big and I want to have a straight forward build experience, that's why I'm not doing this optimization right now.

## License

* MIT (c) Johannes Deml - see [LICENSE](./LICENSE.md)
