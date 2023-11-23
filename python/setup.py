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

from setuptools import setup, Extension, Command


# This class and Extension file is intended only to force setuptools
# to understand we are using extension modules, but because we don't
# include the source files in the 'Extension' object, it gets wrongly
# lost.
class build_ext(Command):
    def initialize_options(self):
        pass

    def finalize_options(self):
        pass

    def run(self):
        pass

    def get_source_files(self):
        return []

    def get_requires_for_build_wheel(self):
        pass


setup_args = dict(
    include_package_data=True,
    packages=["PySide6"],
    ext_modules=[Extension("PySide6", [], py_limited_api=True)],
    cmdclass=dict([("build_ext", build_ext)]),
)
setup(**setup_args)
