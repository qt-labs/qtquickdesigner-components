# PySide6_DS

This package provide the
Qt Design Studio QML components for PySide6
allowing to execute QtDS designs out of the box.

## Install

This considers that the repository main project was built
and installed on an `install` directory at the root of the repository.

While on the 'python' directory, the `configure.py` will configure and copy
files before the packaging.

For the packaging just run `python -m build -w` inside the 'python' directory
(don't forget to `pip install -r requirements.txt` before)

## Releases

Due to the relation with QtDS development,
the versions and release of this module are tied
to QtDS and not to PySide6.
Each PySide6_DS release will have a dependency
of a certain PySide6 version.

## Included files

Depending on the platform, the binaries related to QuickStudio
and components inside qml/QtQuick/Studio are included.
