=================================================
 UniversalDynamicInput_Pack - by Venomalia
=================================================
This pack uses Dynamic Input Textures to create custom buttons in real time.
Unlike traditional custom button packs, you can change the contoler settings at any time and in any way you like
and since it is a function of dolphin, the actual intalation is very simple.
As the name suggests, I try to support as many games and input devices as possible and not to implement every game perfectly.

Sticks, Dpad and motion controls are currently difficult to implement with Dynamic Input Textures, this will probably change with the next version.
For more about Dynamic Input Textures info please visit the main thread.
https://forums.dolphin-emu.org/Thread-introducing-dynamic-input-textures-a-new-feature-for-controller-icons

I am constantly expanding this project and i am open for suggestions.

=================================================
 Installation:
=================================================
- you need Dolphin 5.0-13603 or newer.

- Place the "DynamicInputTextures" into Dolphin's "load" directory,
 "%UserName%\Documents\Dolphin Emulator\Load"
 or when in portebel mode, Dolphin directory"\User\Load"

- Open Dolphin, enter Graphics > Advanced tab > Check Load Custom Textures.

- If it does not work immediately, please check your Contoller settings.

As soon as you start a supported game, Dolphin should generate and load the textures.
If it does not work immediately, please check your Contoller settings.

=================================================
Supported Inputs Devices:
=================================================
- Keyboard Mouse (DInput_0_Keyboard Mouse)
- XInput like Xbox360 or Xbox One (XInput_0_Gamepad)
- Switch Pro controller (DSUClient_0_BetterJoy) required BetterJoy.
- Switch Joy-con (DSUClient_1_BetterJoy) required BetterJoy.
- DualShock4 (DSUClient_0_DualShock4) required ds4windows. Not tested!

=================================================
Supported games:
=================================================
PAL, NTSC-U and NTSC-J versions are supported.

Gamecube

    Baten Kaitos Eternal Wings
    Beyond Good & Evil
    Chibi-Robo
    Dancing Stage Mario Mix
    Doshin the Giant
    Dragon Ball Z Sagas
    Eternal Darkness
    Fire Emblem Path of Radiance
    F-ZERO GX
    Kirby Air Ride
    Luigis Mansion
    Mario Golf Toadstool Tour
    Mario Kart Double Dash
    Mario Party 4
    Mario Party 5
    Mario Party 6
    Mario Party 7
    Mario Power Tennis
    Mario Superstar Baseball
    Metroid Prime 1
    Metroid Prime 2
    Need for Speed Most Wanted
    Need for Speed Underground 2
    One Piece Grand Adventure
    Paper Mario The Thousand-Year Door
    Phantasy Star Online 1&2
    Pikmin 1
    Pikmin 2
    Pokemon Colosseum
    Pokemon XD
    Prince of Persia The Sands of Time
    Prince of Persia The Two Thrones
    Prince of Persia Warrior Within
    Rayman 3
    Shadow the Hedgehog
    Shrek SuperSlam
    Shadow the Hedgehog
    Sonic Mega Collection
    Sonic Riders
    Soulcalibur II
    Star Fox Adventures
    Star Fox Assault
    Super Mario Strikers
    Super Mario Sunshine
    Super Monkey Ball
    Super Monkey Ball 2
    Super Smash Bros Melee
    Tales of Symphonia
    Viewtiful Joe
    WarioWare Inc
    Zelda Collector's Edition
    Zelda Ocarina of Time & Master Quest
    Zelda Twilight Princess
    Zelda Wind Waker

Wii

    Animal Crossing Wii
    Beat the Beat
    Boom Street / Fortune Street
    Castlevania Judgment
    Dokapon Kingdom
    DK Country Returns
    Donkey Kong Jet Race
    Dragon Ball Revenge of King Piccolo
    FFCC Crystal Bearers
    FIFA 15 Legacy Edition
    Fire Emblem Radiant Dawn
    Fragile Dreams
    Mario Kart Wii
    Mario Party 8
    Mario Party 9
    Mario Strikers Charged
    Metroid Other M
    Metroid Prime 3
    Metroid Prime trilogy
    Muramasa The Demon Blade
    Need for Speed Carbon
    Need for Speed Undercover
    New Mario Wii
    Pandora's Tower
    Pikmin 1
    Pikmin 2
    Punch Out
    Rayman Raving Rabbids
    Rayman Raving Rabbids 2
    Rune Factory Frontier
    Rune Factory Tides of Destiny
    Sin and Punishment 2
    Sonic and the Black Knight
    Sonic Colours
    Super Mario Galaxy 1
    Super Mario Galaxy 2
    Super Paper Mario
    Super Smash Bros Brawl
    The Last Story
    The Simpsons
    Tony Hawk's Proving Ground
    Xenoblade Chronicles
    Wii Sports
    Wii Sports Resort
    Zelda Skyward Sword
    Zelda Twilight Princess

Wii Ware

    FAST Racing League

Virtual Console

    Pokémon Snap
    Super Smash Bros
    Super Mario 64
    Zelda Majora's Mask
    Zelda Ocarina of Time

=================================================
Known Issues - Problem solving:
=================================================
- InputSyntax are not supported, like `button A`&`button B`.
 https://wiki.dolphin-emu.org/index.php?title=Input_Syntax
- Stick, dpad and motion controls are incomplete, this is not a mistake!
- Controls that are based on text cannot be changed, affected are
Mario Sunshine, Mario Kart Wii, F-Zero GX and Super Mario Galaxy1&2.

I See ? Buttens,
This means that your controller is not recognised or the button cannot be assigned.
- Input syntax is not possible, only individual buttons are recognised.
- The contoler is not port_1 for GC or Wiimote_1 for Wii? Check Contoller settings.
- You are using the wrong device or it is not supported? Check Supported Devices list.
  or you have several controllers? currently only the first one is supported!
  use "XInput_0_Gamepad" not "XInput_1_Gamepad"

I do not see any changes,
- Are custom textures active? Open Dolphin, enter Graphics > Advanced tab > Check Load Custom Textures.
- You are using the wrong device or it is not supported? Check Supported Devices list.
- You use Dolphin 5.0-13603 or newer?
- Is everything installed correctly? then a texture pack was generated for the game,
check Dolphin's "load\Textures" directory a #Generated_<GameName> directory should be existing!
If it doesn't, you must have done something wrong.

=================================================
 Credits:
=================================================

Special thanks:
iwubcode for this great feature.
and to all helpers for beta-tests, feedback, texture-dumps and other improvements.
Kupo, Ratso, Intruso.

Super Mario Galaxy 1 & 2 UI assets a from
https://forums.dolphin-emu.org/Thread-super-mario-galaxy-1-hd-texture-mod
https://forums.dolphin-emu.org/Thread-super-mario-galaxy-2-hd-texture-mod

Phantasy Star Online 1&2UI assets a from
https://forums.dolphin-emu.org/Thread-phantasy-star-online-episode-i-ii-hd-ui-project

I use waifu2x for some UI elements.

License: CC BY 4.0