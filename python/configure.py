#############################################################################
##
## Copyright (C) 2024 The Qt Company Ltd.
## Contact: https://www.qt.io/licensing/
##
## This file is part of the Qt Design Studio project.
##
## $QT_BEGIN_LICENSE:LGPL$
## Commercial License Usage
## Licensees holding valid commercial Qt licenses may use this file in
## accordance with the commercial license agreement provided with the
## Software or, alternatively, in accordance with the terms contained in
## a written agreement between you and The Qt Company. For licensing terms
## and conditions see https://www.qt.io/terms-conditions. For further
## information use the contact form at https://www.qt.io/contact-us.
##
## GNU Lesser General Public License Usage
## Alternatively, this file may be used under the terms of the GNU Lesser
## General Public License version 3 as published by the Free Software
## Foundation and appearing in the file LICENSE.LGPL3 included in the
## packaging of this file. Please review the following information to
## ensure the GNU Lesser General Public License version 3 requirements
## will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
##
## GNU General Public License Usage
## Alternatively, this file may be used under the terms of the GNU
## General Public License version 2.0 or (at your option) the GNU General
## Public license version 3 or any later version approved by the KDE Free
## Qt Foundation. The licenses are as published by the Free Software
## Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
## included in the packaging of this file. Please review the following
## information to ensure the GNU General Public License requirements will
## be met: https://www.gnu.org/licenses/gpl-2.0.html and
## https://www.gnu.org/licenses/gpl-3.0.html.
##
## $QT_END_LICENSE$
##
#############################################################################

import platform
import shutil
import subprocess
import sys
from pathlib import Path


def get_platform_tag() -> str:
    _os = sys.platform
    arch = platform.machine()

    # as Qt6 we know it's GLIBC 2.28 on RHEL 8.4
    _tag = ""
    if _os == "linux":
        glibc = platform.libc_ver()[1].replace(".", "_")
        # Will generate manylinux_2_28_x86_64
        _tag = f"manylinux_{glibc}_{arch}"
    elif _os == "darwin":
        # TODO: This skips the process from PySide6
        # to get the  MACOSX_DEPLOYMENT_TARGET to avoid
        # an extra dependency when building. We rely on the
        # CI having the proper version.
        # mac_ver, _, _ = platform.mac_ver()
        # FIXME: Rely on CI configuration
        mac_ver = "11.0.0"
        # If we get 10.14.2 for example, and transform into 10_14
        target = "_".join(mac_ver.split(".")[:2])
        _tag = f"macosx_{target}_universal2"
    elif _os == "win32":
        win_arch = platform.architecture()[0]
        msvc_arch = "x86" if win_arch.startswith("32") else "amd64"
        _tag = f"win_{msvc_arch}"

    return _tag


# NOTE: Needs to be set by hand
QTDS_VERSION = "4.5"
def get_ds_version() -> str:
    with open(Path("PySide6/__init__.py"), "w") as f:
        f.write(f'__version__ = "{QTDS_VERSION}"')

    return "PySide6.__version__"


def generate_pyproject_toml(artifacts: Path) -> str:
    content = None

    _tag = get_platform_tag()
    _version = get_ds_version()

    with open(artifacts / "pyproject.toml.base") as f:
        content = (
            f.read().replace("PROJECT_VERSION", f'"{_version}"').replace("PROJECT_TAG", f'"{_tag}"')
        )

    return content


if __name__ == "__main__":

    # Installation path of the qtquickdesigner-components
    # not on a general Qt installation path.
    BASE_DIR = Path("../install")

    # TODO: This is only considering the Linux scenario
    if sys.platform in ("linux", "darwin"):
        DST_LIB = Path("PySide6/Qt/lib")
        DST_QML = Path("PySide6/Qt/qml/QtQuick/")
        if sys.platform == "linux":
            LIB_PATTERN = "libQt6QuickStudio*"
        elif sys.platform == "darwin":
            LIB_PATTERN = "QtQuickStudio*"
    elif sys.platform == "win32":
        DST_LIB = Path("PySide6/")
        DST_QML = Path("PySide6/qml/QtQuick/")
        LIB_PATTERN = "Qt6QuickStudio*"
    else:
        print("Error: Unsupported platform")
        sys.exit(1)

    # Create base structure
    DST_LIB.mkdir(parents=True, exist_ok=True)
    DST_QML.mkdir(parents=True, exist_ok=True)

    # Read the base pyproject.toml file
    # and replace some information
    # with the platform information
    pyproject_toml_content = generate_pyproject_toml(Path("artifacts/"))
    with open(Path("pyproject.toml"), "w") as f:
        f.write(pyproject_toml_content)

    # Copy components in the same structure
    base = BASE_DIR / Path("lib")
    for file in base.glob(LIB_PATTERN):
        # Exclude prl files
        if file.suffix in (".prl", ".dSYM"):
            continue
        if sys.platform == "darwin":
            print(f"Copying directory: {file} to {DST_LIB}")
            dst_dir = Path(f"{DST_LIB}/{file.stem}.framework")
            shutil.copytree(
                file, dst_dir, symlinks=True, dirs_exist_ok=True, ignore_dangling_symlinks=True
            )
        else:
            print(f"Copying file: {file} to {DST_LIB}")
            shutil.copy(file, DST_LIB)

    BASE_QTQUICK_DIR = BASE_DIR / Path("qml/QtQuick/")
    print(f"Copying recursively the directory {BASE_QTQUICK_DIR} to {DST_QML}")
    shutil.copytree(BASE_QTQUICK_DIR, DST_QML, dirs_exist_ok=True)

    with open("MANIFEST.in", "w", encoding="utf-8") as f:
        f.write("graft PySide6\n")
