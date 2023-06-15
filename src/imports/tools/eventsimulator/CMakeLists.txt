set_source_files_properties(EventSimulator.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_internal_add_qml_module(QuickStudioEventSimulator
    URI "QtQuick.Studio.EventSimulator"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        EventSimulator.qml
        EventSimulatorDelegate.qml
)
