#! /usr/bin/env python3
import shutil
from collections.abc import Callable
from functools import partial
from pathlib import Path

from imageio.v3 import imread, imwrite
from numpy import flipud, rot90, uint8
from numpy.typing import NDArray
from tqdm.contrib.concurrent import process_map

rot270 = partial(rot90, k=-1)

default_devices_folder = Path(__file__).parent
mirror_folder = default_devices_folder / "_Mirror"
rotated90_folder = default_devices_folder / "_Rotated90"


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


def main() -> None:
    shutil.rmtree(mirror_folder, ignore_errors=True)
    shutil.rmtree(rotated90_folder, ignore_errors=True)
    image_paths = tuple(default_devices_folder.glob("**/*.png"))
    process_map(generate_images_from_source, image_paths, chunksize=1)  # type: ignore[no-untyped-call]


if __name__ == "__main__":
    main()
