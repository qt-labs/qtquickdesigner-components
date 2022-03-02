qt_path_join(installdesignerdir "${INSTALL_QMLDIR}" "QtQuick/Studio/Components")
qt_path_join(targetdesignerdir "${CMAKE_BINARY_DIR}" "${installdesignerdir}/designer")

file(
    COPY .
    DESTINATION ${targetdesignerdir}
    FILES_MATCHING PATTERN "*qml"
                   PATTERN "*metainfo"
                   PATTERN "images/*png"
                   PATTERN "CMakeFiles" EXCLUDE
)

qt_install(
    DIRECTORY ${targetdesignerdir}
    DESTINATION ${installdesignerdir}
)
