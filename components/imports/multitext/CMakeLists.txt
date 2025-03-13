qt_add_library(QuickStudioMultiText STATIC)
qt6_add_qml_module(QuickStudioMultiText
    URI "QtQuick.Studio.MultiText"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    NO_LINT
    NO_CACHEGEN
    QML_FILES
        MultiTextElement.qml
        MultiTextItem.qml
        MultiTextException.qml
)

register_plugin(QuickStudioMultiText)
