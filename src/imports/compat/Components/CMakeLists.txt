map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set_source_files_properties(${MIRROR_DIR}/ArcItem.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "ArcItem.qml"
)

qt_internal_add_qml_module(QuickUltraLiteStudioComponents
    URI "QtQuickUltralite.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    ${qds_qml_extra_args}
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        ${MIRROR_DIR}/ArcItem.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
