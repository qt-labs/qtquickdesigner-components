set_source_files_properties(QulPerf.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(QuickUltraLiteStudioExtras STATIC)
qt6_add_qml_module(QuickUltraLiteStudioExtras
    URI "QtQuickUltralite.Extras"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        AnimatedSpriteDirectory.qml
        ColorizedImage.qml
        ItemBuffer.qml
        StaticText.qml
        QulPerf.qml
)

target_link_libraries(QuickUltraLiteStudioExtras PRIVATE Qt6::Gui)

register_plugin(QuickUltraLiteStudioExtras)
