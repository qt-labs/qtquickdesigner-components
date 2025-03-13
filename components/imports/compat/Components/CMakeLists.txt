qt_add_library(QuickUltraLiteStudioComponents STATIC)
qt6_add_qml_module(QuickUltraLiteStudioComponents
    URI "QtQuickUltralite.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ArcItem.qml
)

target_link_libraries(QuickUltraLiteStudioComponents PRIVATE Qt6::Gui)

register_plugin(QuickUltraLiteStudioComponents)
