map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/AnimatedSpriteDirectory.qml
    ${MIRROR_DIR}/ColorizedImage.qml
    ${MIRROR_DIR}/ItemBuffer.qml
    ${MIRROR_DIR}/StaticText.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

set_source_files_properties(${MIRROR_DIR}/QulPerf.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
        QT_RESOURCE_ALIAS "QulPerf.qml"
)

qt_internal_add_qml_module(QuickUltraLiteStudioExtras
    URI "QtQuickUltralite.Extras"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        ${MIRROR_QML_FILES}
        ${MIRROR_DIR}/QulPerf.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()


