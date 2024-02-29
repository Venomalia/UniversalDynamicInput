# Universal Dynamic Input

[![Wiki](https://img.shields.io/badge/Wiki-grey)](https://github.com/Venomalia/UniversalDynamicInput/wiki) [![Changelog](https://img.shields.io/badge/Changelog-grey)](https://github.com/Venomalia/UniversalDynamicInput/blob/main/Changelog.md) [![Requests](https://img.shields.io/badge/Requests-3a3)](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose) [![Discord](https://img.shields.io/badge/Discord-blue?logo=Discord&logoColor=fff)](https://discord.gg/q9RtF4Tm9E) [![Dolphin](https://img.shields.io/badge/Dolphin-Forum-88e)](https://forums.dolphin-emu.org/Thread-universal-dynamic-input-texture-pack) [![DIT CreatorTool](https://img.shields.io/badge/Dolphin-DIT_Creator_Tool-999)](https://github.com/Venomalia/DolphinDynamicInputTextureCreator/releases) [![Downloads](https://img.shields.io/github/downloads/Venomalia/UniversalDynamicInput/total?color=907&label=Downloads)](https://github.com/Venomalia/UniversalDynamicInput/releases) [![Stars](https://img.shields.io/github/stars/Venomalia/UniversalDynamicInput?color=990&label=Stars)](https://github.com/Venomalia/UniversalDynamicInput/stargazers)

![Image1](https://i.imgur.com/WIxE3IZ.jpg "Image1")

**UniversalDynamicInput** is a custom button package for [Dolphin emulator](https://dolphin-emu.org/).  
It uses [dynamic input textures](https://forums.dolphin-emu.org/Thread-introducing-dynamic-input-textures-a-new-feature-for-controller-icons) to create custom buttons in **real time**.  
Unlike traditional button packs, you can change the control settings at **any time**,  
the in-game buttons are automatically updated to match the controller and setting you're using.  
Another advantage is that there are no problems with other texture packs.  
Take a look at this [Dolphin progress report](https://dolphin-emu.org/blog/2020/12/10/dolphin-progress-report-october-2020/#50-12801-dynamic-input-textures-by-iwubcode) for more info.

### [<img src="https://img.shields.io/github/v/release/Venomalia/UniversalDynamicInput?label=Download&style=for-the-badge" alt="Download" height="35"/>](https://github.com/Venomalia/UniversalDynamicInput/releases)

## Which Dolphin versions are supported?

Dolphin 5.0-15214 or [newer](https://dolphin-emu.org/download/) and all branches based on one of these versions.

- [Dolphin](https://dolphin-emu.org/) for desktop Windows, MacOS and Linux based systems.
- [Dolphin UWP](https://github.com/UWP-Team/dolphinUWP) for Xbox Series X and S.
- [RetroDECK](https://retrodeck.net/) for Linux and SteamOS.
- [EmuDeck](https://www.emudeck.com/) for SteamOS.

## What games are supported?

You can find all supported games on the [wiki](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-games), if a game is not supported you can [add it](https://github.com/Venomalia/UniversalDynamicInput/wiki/Create-a-Package) or open a [request](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose).

## Which input devices are supported?

You can find all supported input devices on the [wiki](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-Input-Devices), if a devices is not supported you can [add it](https://github.com/Venomalia/UniversalDynamicInput/wiki/Add-a-Devices) or open a [request](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose).

## How to install the pack?

You can also find a detailled installation for your version on the [wiki](https://github.com/Venomalia/UniversalDynamicInput/wiki/Installation).

#### Installation

1. Place the **DynamicInputTextures** folder into Dolphin's **Load** directory:
   - You can find the load folder if you navigate in dolphin to `File` > `Open User Folder` and navigate to the `Load` folder.
   - By default you can also find the load folder under
     - **Windows:** _`%UserName%\Documents\Dolphin Emulator\Load`_
     - **Linux:** _`~/.dolphin-emu/Load`_ or _`~/.local/share/dolphin-emu/Load`_ depending on your system
     - **MacOS:** _`~/Library/Application Support/Dolphin/Load`_
     - **Xbox:** Xbox Usb drive at _`Dolphin\Load`_
   - The path should now look like this `.\Load\DynamicInputTextures`
1. Open Dolphin, enter `Graphics` > `Advanced` tab > Check **`Load Custom Textures`**.
1. As soon as you start a [supported game](https://github.com/Venomalia/UniversalDynamicInput/wiki/Supported-games), Dolphin will generate and load the new button textures.
   > If you have any problems take a look at our [troubleshooting](https://github.com/Venomalia/UniversalDynamicInput/wiki/Problem-solving#troubleshooting) guide.

#### Clone

It is also possible to **Clone** this repository to Dolphin's **Load** directory.

## FAQ:

### Does it work with texture packs?

Yes, there are no known problems.

### Does it work with netplay?

Yes, but there can be problems with wii games because only player 1 can use Wii Remote 1.

### How to create a package for this project?

Try this [guide](https://github.com/Venomalia/UniversalDynamicInput/wiki/Create-a-Package).

### The buttons that are displayed do not fit my controller!

Try the [DevicesTextureChanger](https://github.com/Venomalia/UniversalDynamicInput/wiki/Windows-Supported-Input-Devices#devicestexturechanger) or create a [request](https://github.com/Venomalia/UniversalDynamicInput/issues/new/choose).

### Where can I ask questions?

You can use [Discord](https://discord.gg/q9RtF4Tm9E) or [this thread](https://forums.dolphin-emu.org/Thread-universal-dynamic-input-texture-pack) in the Dolphin forum.

## Credits:

### [![contributors](https://img.shields.io/github/contributors/Venomalia/UniversalDynamicInput?style=for-the-badge)](https://github.com/Venomalia/UniversalDynamicInput/graphs/contributors)

Super Mario Galaxy [1](https://forums.dolphin-emu.org/Thread-super-mario-galaxy-1-hd-texture-mod) & [2](https://forums.dolphin-emu.org/Thread-super-mario-galaxy-2-hd-texture-mod) UI assets created by **Razius**.

Phantasy Star Online 1 & 2 UI assets created by [LutheeMajestic](https://forums.dolphin-emu.org/Thread-phantasy-star-online-episode-i-ii-hd-ui-project) Licensed under [![license](https://img.shields.io/badge/CC%20BY--SA%204.0-lightgrey)](https://creativecommons.org/licenses/by-sa/4.0/deed.de).

### Special thanks:

[iwubcode](https://github.com/iwubcode) for the development of [dynamic input textures](https://forums.dolphin-emu.org/Thread-introducing-dynamic-input-textures-a-new-feature-for-controller-icons).

All helpers for beta-tests, feedback, texture-dumps and other improvements.

---

[![license](https://img.shields.io/github/license/Venomalia/UniversalDynamicInput?label=License)](https://github.com/Venomalia/UniversalDynamicInput/blob/main/LICENSE)
