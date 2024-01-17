#####################################################################
## QuickStudioApplicationModule:
#####################################################################

qt_add_library(QuickStudioUtils STATIC)
qt6_add_qml_module(QuickStudioUtils
    URI "QtQuick.Studio.Utils"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    SOURCES
        quickstudiocsvtablemodel.cpp quickstudiocsvtablemodel_p.h
        quickstudiofilereader.cpp quickstudiofilereader_p.h
    QML_FILES
        JsonListModel.qml JsonBackend.qml ChildListModel.qml
)
target_link_libraries(QuickStudioUtils PRIVATE Qt6::Gui)


