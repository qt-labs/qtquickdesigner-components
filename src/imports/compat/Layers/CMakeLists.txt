map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/ApplicationScreens.qml
    ${MIRROR_DIR}/ImageLayer.qml
    ${MIRROR_DIR}/ItemLayer.qml
    ${MIRROR_DIR}/Screen.qml
    ${MIRROR_DIR}/SpriteLayer.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

set_source_files_properties(${MIRROR_DIR}/+DesignMode/Screen.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "+DesignMode/Screen.qml"
)

qt_internal_add_qml_module(QuickUltraLiteStudioLayers
    URI "QtQuickUltralite.Layers"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        ${MIRROR_QML_FILES}
        ${MIRROR_DIR}/+DesignMode/Screen.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

