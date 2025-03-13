qt_add_library(QuickUltraLiteStudioProfiling STATIC)
qt6_add_qml_module(QuickUltraLiteStudioProfiling
    URI "QtQuickUltralite.Profiling"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1 2
    QML_FILES
        QulPerfOverlay.qml
)

target_link_libraries(QuickUltraLiteStudioProfiling PRIVATE Qt6::Gui)

register_plugin(QuickUltraLiteStudioProfiling)
