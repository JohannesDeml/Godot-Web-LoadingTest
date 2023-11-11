# Godot WebGL Loading Test

![Preview](./preview.png)

[![](https://img.shields.io/github/release-date/JohannesDeml/Godot-WebGL-LoadingTest.svg)](https://github.com/JohannesDeml/UnityWebGL-LoadingTest/releases) [![Godot 4.1.2](https://img.shields.io/badge/godot-4.1.2-green.svg?logo=godot-engine&logoColor=white&cacheSeconds=2592000)](https://godotengine.org/download/archive/4.1.2-stable/)

*Testing Godot's WebGL size and loading times* - 🚧 Work in progress 🚧  

* [Overview page of all builds](https://deml.io/experiments/godot-webgl/)
* [Implementation in Unity](https://github.com/JohannesDeml/UnityWebGL-LoadingTest)


## Features

* Physics
* Responsive template layout

## Live Demos

Version | Size | Link
--- | --- | ---
4.1.2 | 27.12 MB | https://deml.io/experiments/unity-webgl/2022.2.12f1-webgl2

## Platform Compatibility

| Platform   | Chrome | Firefox | Edge | Safari |
| ---------- | :----: | :-----: | :--: | :----: |
| Windows 10 |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| Linux      |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| Mac        |   ❌    |    ❌️    |  ❌   |   ❌️    |
| Android    |   ✔️    |    ✔️    |  ✔️   |   ➖    |
| iOS        |   ❌    |    ❌    |  ❌   |   ❌    |

✔️ *: Supported* | ⚠️ *: Warning , see below* | ❌ *: not supported* | ➖ *: Not applicable*

*This matrix is for Godot 4.1, other versions might differ*

## Notes

* This is very much work in progress. I'm mostly developing with Unity and the comparison to my [unity webgl project](https://github.com/JohannesDeml/UnityWebGL-LoadingTest) might not be fair, since I have a lot more experience there and also fine-tuned it over the last years.
* I haven't come around to use brotli or gzip compression (I would like to have it baked in the file similar to Unity's solution), therefore download sizes are a lot bigger than they need to be
* Starting the engine takes a long time - with a custom export template that does not include all engine features this should be faster, I hope I will get to that
* Exporting the project is a bliss compared to Unity, it is finished in a second while for Unity it takes 10+ minutes on my laptop.
* In Godot 4.1 shadows are not yet supported on WebGL (Shadows do work for Godot 3.5)

## Older versions

You can find a list of all live builds with their sizes over here: https://deml.io/experiments/godot-webgl/

## License

* MIT (c) Johannes Deml - see [LICENSE](./LICENSE.md)
