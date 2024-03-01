#! /usr/bin/env python3
import shutil
from collections.abc import Callable
from enum import IntEnum
from functools import partial
from pathlib import Path

from imageio.v3 import imread, imwrite
from numpy import dstack, flipud, rot90, uint8
from numpy.typing import NDArray
from tqdm.contrib.concurrent import process_map


class ColorChannel(IntEnum):
    Red = 0
    Green = 1
    Blue = 2
    Alpha = 3


default_devices_folder = Path(__file__).parent
mirror_folder = default_devices_folder / "_Mirror"
rotated90_folder = default_devices_folder / "_Rotated90"

rot270 = partial(rot90, k=-1)


def keep_rg(image: NDArray[uint8]) -> NDArray[uint8]:
    """Replaces channels RGBA with RRRG."""
    red = image[:, :, ColorChannel.Red]
    green = image[:, :, ColorChannel.Green]
    new_image = image.copy()

    new_image[:, :, ColorChannel.Green] = red
    new_image[:, :, ColorChannel.Blue] = red
    if image.shape[2] != 4:
        new_image = dstack((new_image, green))
    else:
        new_image[:, :, ColorChannel.Alpha] = green
    return new_image


def keep_ba(image: NDArray[uint8]) -> NDArray[uint8]:
    """Replaces channels RGBA with BBBA."""
    blue = image[:, :, ColorChannel.Blue]
    new_image = image.copy()

    new_image[:, :, ColorChannel.Red] = blue
    new_image[:, :, ColorChannel.Green] = blue
    return new_image


def should_generate_two_palettes(
    source_image: NDArray[uint8], relative_path: Path
) -> bool:
    return (
        (
            # Skip B&W images for TwoPalettes
            len(source_image.shape) > 2
            # TwoPalettes is only used with Flat* for now, avoid generating unused images
            and relative_path.parts[1].startswith("Flat")
            # Masks by nature only have 1 channel and TwoPalettes textures already include Alpha
            and not any(part.endswith("_Mask") for part in relative_path.parts)
        )
        # However, we still need the icon from Device/Icon.png for default templates
        or relative_path.parts[-2:] == ("Device", "Icon.png")
    )


def generate_new_image(
    transform: Callable[[NDArray[uint8]], NDArray[uint8]],
    image: NDArray[uint8],
    destination: Path,
) -> NDArray[uint8]:
    new_image = transform(image)
    destination.parent.mkdir(parents=True, exist_ok=True)
    imwrite(destination, new_image)
    return new_image


def generate_images_from_source(source_path: Path) -> None:
    relative_path = source_path.relative_to(default_devices_folder)
    source_image = imread(source_path)

    # This could be parallelized further in more subprocesses

    # Rotated is only used with Defaultstyle for now, avoid generating unused images
    if relative_path.parts[1] == "Defaultstyle":
        # _Rotated90/
        _rotated90_image = generate_new_image(
            rot270,
            source_image,
            rotated90_folder / relative_path,
        )
    # _Mirror/
    _mirror_image = generate_new_image(
        flipud,
        source_image,
        mirror_folder / relative_path,
    )
    if should_generate_two_palettes(source_image, relative_path):
        two_palettes_rg_relative_path = Path("_TwoPalettes_RG") / relative_path
        two_palettes_ba_relative_path = Path("_TwoPalettes_BA") / relative_path

        # _TwoPalettes_RG/
        _two_palettes_rg = generate_new_image(
            keep_rg,
            source_image,
            default_devices_folder / two_palettes_rg_relative_path,
        )
        # _TwoPalettes_BA/
        _two_palettes_ba = generate_new_image(
            keep_ba,
            source_image,
            default_devices_folder / two_palettes_ba_relative_path,
        )
        # _Mirror/_TwoPalettes_RG/
        _mirror_two_palettes_rg = generate_new_image(
            keep_rg,
            _mirror_image,
            mirror_folder / two_palettes_rg_relative_path,
        )
        # _Mirror/_TwoPalettes_BA/
        _mirror_two_palettes_ba = generate_new_image(
            keep_ba, _mirror_image, mirror_folder / two_palettes_ba_relative_path
        )


def main() -> None:
    shutil.rmtree(mirror_folder, ignore_errors=True)
    shutil.rmtree(rotated90_folder, ignore_errors=True)
    shutil.rmtree(default_devices_folder / "_TwoPalettes_RG", ignore_errors=True)
    shutil.rmtree(default_devices_folder / "_TwoPalettes_BA", ignore_errors=True)
    image_paths = tuple(default_devices_folder.glob("**/*.png"))
    process_map(generate_images_from_source, image_paths, chunksize=1)  # type: ignore[no-untyped-call]


if __name__ == "__main__":
    main()
