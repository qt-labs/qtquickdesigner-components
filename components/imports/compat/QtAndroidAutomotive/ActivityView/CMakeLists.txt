qt_add_library(AndroidAutomotiveActivityView STATIC)
qt6_add_qml_module(AndroidAutomotiveActivityView
    URI "QtAndroidAutomotive.ActivityView"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ActivityView.qml
)

target_link_libraries(AndroidAutomotiveActivityView PRIVATE Qt6::Gui)

register_plugin(AndroidAutomotiveActivityView)
