qt_add_library(QuickUltraLiteStudioLayers STATIC)
qt6_add_qml_module(QuickUltraLiteStudioLayers
    URI "QtQuickUltralite.Layers"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        ApplicationScreens.qml
        ImageLayer.qml
        ItemLayer.qml
        Screen.qml
        SpriteLayer.qml
        +DesignMode/Screen.qml
)

target_link_libraries(QuickUltraLiteStudioLayers PRIVATE Qt6::Gui)

register_plugin(QuickUltraLiteStudioLayers)
