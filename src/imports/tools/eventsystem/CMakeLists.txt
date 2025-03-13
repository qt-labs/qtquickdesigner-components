map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set_source_files_properties(${MIRROR_DIR}/EventSystem.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
        QT_RESOURCE_ALIAS "EventSystem.qml"
)

set_source_files_properties(${MIRROR_DIR}/EventListener.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "EventListener.qml"
)

qt_internal_add_qml_module(QuickStudioEventSystem
    URI "QtQuick.Studio.EventSystem"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_DIR}/EventSystem.qml
        ${MIRROR_DIR}/EventListener.qml
)

