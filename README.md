# Qt Design Studio QML modules

These modules provide the types  

# Usage

The modules get installed into Qt and provide the respective imports for QML.

# Building

```
mkdir build
cd build
cmake -GNinja -DCMAKE_TOOLCHAIN_FILE=<path_to_qt_install_directory>/lib/cmake/Qt6/qt.toolchain.cmake -DCMAKE_INSTALL_PREFIX=<path_to_qt_install_directory> -DCMAKE_PREFIX_PATH=<path_to_qt_install_directory> -DCMAKE_BUILD_TYPE=<Debug|Release> ..
cmake --build .
cmake --install .
```

This will install the Qt Design Studio modules in your Qt installation directory.

