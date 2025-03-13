qt_add_library(QuickStudioUtils STATIC)
qt6_add_qml_module(QuickStudioUtils
    URI "QtQuick.Studio.Utils"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    SOURCES
        quickstudiocsvtablemodel.cpp
        quickstudiocsvtablemodel.h
        quickstudiofilereader.cpp
        quickstudiofilereader.h
    QML_FILES
        JsonListModel.qml
        JsonBackend.qml
        ChildListModel.qml
)

target_link_libraries(QuickStudioUtils PRIVATE Qt6::Gui)

register_plugin(QuickStudioUtils)
