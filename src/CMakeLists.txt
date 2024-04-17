###qt_path_join(targetbasedir ${CMAKE_BINARY_DIR} "qml")
###qt_path_join(qmlinstalldir ${QT_INSTALL_DIR} ${INSTALL_QMLDIR})

set(qds_qml_extra_args "")
if(QT_QDS_COMPONENTS_NOWARN)
   list(APPEND qds_qml_extra_args NO_LINT)
endif()

add_subdirectory(imports)
