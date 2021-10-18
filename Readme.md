# Universal Dynamic Input
[![Wiki](https://img.shields.io/badge/Wiki-grey)](https://github.com/Venomalia/UniversalDynamicInput/wiki) [![Changelog](https://img.shields.io/badge/Changelog-grey)](https://github.com/Venomalia/UniversalDynamicInput/blob/main/Changelog.md) [![Requests](https://img.shields.io/badge/Requests-3a3)](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose) [![Discord](https://img.shields.io/badge/Discord-blue?logo=Discord&logoColor=fff)](https://discord.gg/vEQYMPxgSR) [![Dolphin](https://img.shields.io/badge/Dolphin-Forum-88e)](https://forums.dolphin-emu.org/Thread-universal-dynamic-input-texture-pack) [![DIT CreatorTool](https://img.shields.io/badge/Dolphin-DIT_Creator_Tool-999)](https://github.com/Venomalia/DolphinDynamicInputTextureCreator/releases) [![license](https://img.shields.io/github/license/Venomalia/UniversalDynamicInput?label=License)](https://github.com/Venomalia/UniversalDynamicInput/blob/main/LICENSE) [![Downloads](https://img.shields.io/github/downloads/Venomalia/UniversalDynamicInput/total?color=907&label=Downloads)](https://github.com/Venomalia/UniversalDynamicInput/releases) [![Stars](https://img.shields.io/github/stars/Venomalia/UniversalDynamicInput?color=990&label=Stars)](https://github.com/Venomalia/UniversalDynamicInput/stargazers)

**UniversalDynamicInput** is a custom button package for [Dolphin emulator](https://dolphin-emu.org/). It uses [dynamic input textures](https://forums.dolphin-emu.org/Thread-introducing-dynamic-input-textures-a-new-feature-for-controller-icons) to create custom buttons in real time. Unlike traditional button packages, you can change the control settings at any time and the in-game textures will change. There are also no problems with texture packages. Take a look at this [Dolphin progress report](https://dolphin-emu.org/blog/2020/12/10/dolphin-progress-report-october-2020/#50-12801-dynamic-input-textures-by-iwubcode) for more info.


### [![Download](https://img.shields.io/github/v/release/Venomalia/UniversalDynamicInput?label=Download&style=for-the-badge)](https://github.com/Venomalia/UniversalDynamicInput/releases)

##  [Installation](https://github.com/Venomalia/UniversalDynamicInput/wiki/Installation):
- Dolphin 5.0-13603 or [newer](https://de.dolphin-emu.org/download/).
- The latest [release](https://github.com/Venomalia/UniversalDynamicInput/releases) of UniversalDynamicInput.
- At least one [Supported Game](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-games).
- At least one [Supported Device](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-Inputs-Devices).
- Place the **DynamicInputTextures** folder into Dolphin's **Load** directory:
  - Standard directory: `%UserName%\Documents\Dolphin Emulator\Load`
  - Portable mode (portable.txt): `DolphinDirectory\User\Load`
- Open Dolphin, enter Graphics > Advanced tab > Check `Load Custom Textures`.

As soon as you start a [supported game](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-games), Dolphin should generate and load the textures.

If it does not work, try this [guide](https://github.com/Venomalia/UniversalDynamicInput/wiki/Problem-solving).

##  Screenshots:
![Image1](https://i.imgur.com/WIxE3IZ.jpg "Image1")
![Image2](https://i.imgur.com/3pcxh5P.jpg "Image2")

## [Supported Games](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-games)
## [Supported Devices](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-Input-Devices)

## FAQ:
### Does it work with texture packs?
Yes, there are no known problems.

### Does it work with netplay?
Yes, but there can be problems with wii games because only player 1 can use Wii Remote 1.

### Do we accept game suggestions?
Yes, but we need the [texture dumps](https://github.com/Venomalia/UniversalDynamicInput/wiki/Dumping-Textures) to implement it. Dumps can be sent to us via [Github](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose) or [Discord](https://discord.gg/vEQYMPxgSR).

### My controller is not supported?
here you can make a [request](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose).

### How to create a package for this project?
Try this [guide](https://github.com/Venomalia/UniversalDynamicInput/wiki/Create-a-Package). make a [contribution](https://github.com/Venomalia/UniversalDynamicInput/wiki/Contributing)

### The buttons that are displayed do not fit my controller!
Try the [DevicesTextureChanger](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-Inputs-Devices#devicestexturechanger) or create a [request](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose).

### Where can I ask questions?
You can use [Discord](https://discord.gg/vEQYMPxgSR) or [this thread](https://forums.dolphin-emu.org/Thread-universal-dynamic-input-texture-pack) in the Dolphin forum.

## Credits:
### [![contributors](https://img.shields.io/github/contributors/Venomalia/UniversalDynamicInput?style=for-the-badge)](https://github.com/Venomalia/UniversalDynamicInput/graphs/contributors)

Super Mario Galaxy [1](https://forums.dolphin-emu.org/Thread-super-mario-galaxy-1-hd-texture-mod) & [2](https://forums.dolphin-emu.org/Thread-super-mario-galaxy-2-hd-texture-mod) UI assets created by **Razius**.

Phantasy Star Online 1 & 2 UI assets created by [LutheeMajestic](https://forums.dolphin-emu.org/Thread-phantasy-star-online-episode-i-ii-hd-ui-project) Licensed under [![license](https://img.shields.io/badge/CC%20BY--SA%204.0-lightgrey)](https://creativecommons.org/licenses/by-sa/4.0/deed.de).

### Special thanks:
[iwubcode](https://github.com/iwubcode) for this great feature and to all helpers for beta-tests, feedback, texture-dumps and other improvements.

## License: CC0
[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/deed.de)
