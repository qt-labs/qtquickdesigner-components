
map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set_source_files_properties(${MIRROR_DIR}/EventSimulator.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
        QT_RESOURCE_ALIAS "EventSimulator.qml"
)

set_source_files_properties(${MIRROR_DIR}/EventSimulatorDelegate.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "EventSimulatorDelegate.qml"
)

qt_internal_add_qml_module(QuickStudioEventSimulator
    URI "QtQuick.Studio.EventSimulator"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_DIR}/EventSimulator.qml
        ${MIRROR_DIR}/EventSimulatorDelegate.qml
)
