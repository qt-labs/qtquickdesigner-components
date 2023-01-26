qt_internal_add_qml_module(QuickUltraLiteStudioLayers
    URI "QtQuickUltralite.Layers"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        Application.qml
        ImageLayer.qml
        ItemLayer.qml
        Screen.qml
        SpriteLayer.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

