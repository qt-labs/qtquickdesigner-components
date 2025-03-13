map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/MultiTextElement.qml
    ${MIRROR_DIR}/MultiTextItem.qml
    ${MIRROR_DIR}/MultiTextException.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioMultiText
    URI "QtQuick.Studio.MultiText"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_QML_FILES}
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
