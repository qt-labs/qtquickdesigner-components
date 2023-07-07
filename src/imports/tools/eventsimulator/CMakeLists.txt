set_source_files_properties(EventSimulator.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)
qt_add_library(QuickStudioEventSimulator STATIC)
qt6_add_qml_module(QuickStudioEventSimulator
    URI "QtQuick.Studio.EventSimulator"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    NO_LINT
    NO_CACHEGEN
    QML_FILES
        EventSimulator.qml
        EventSimulatorDelegate.qml
)
