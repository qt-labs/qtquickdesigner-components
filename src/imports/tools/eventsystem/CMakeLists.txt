set_source_files_properties(EventSystem.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(QuickStudioEventSystem STATIC)
qt6_add_qml_module(QuickStudioEventSystem
    URI "QtQuick.Studio.EventSystem"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    NO_LINT
    NO_CACHEGEN
    QML_FILES
        EventSystem.qml
        EventListener.qml
)

