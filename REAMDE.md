# Qt Design Studio QML modules

These modules provide the types  

# Usage

The modules get installed into Qt and provide the respective imports for QML.

# Building

```
mkdir build
cd build
cmake -GNinja -DCMAKE_INSTALL_PREFIX=path_to_qt_install_directory path_to_qtquickdesigner-components_cmake
cmake --build .
cmake --install .
```

This will install the Qt Design Studio modules in your Qt installation directory.

