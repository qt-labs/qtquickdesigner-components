set_source_files_properties(EventSystem.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt6_add_qml_module(QuickStudioEventSystem
    URI "QtQuick.Studio.EventSystem"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        EventSystem.qml
        EventListener.qml
)

