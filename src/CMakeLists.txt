qt_path_join(targetbasedir ${CMAKE_BINARY_DIR} "qml")
qt_path_join(qmlinstalldir ${QT_INSTALL_DIR} ${INSTALL_QMLDIR})

add_subdirectory(imports)
