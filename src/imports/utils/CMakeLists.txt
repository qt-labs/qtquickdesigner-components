#####################################################################
## QuickStudioApplicationModule:
#####################################################################

qt_internal_add_qml_module(QuickStudioUtils
    URI "QtQuick.Studio.Utils"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1 2
 INCLUDE_DIRECTORIES
    ${CMAKE_CURRENT_SOURCE_DIR}
    SOURCES
        quickstudiocsvtablemodel.cpp quickstudiocsvtablemodel_p.h
        quickstudiofilereader.cpp quickstudiofilereader_p.h
    QML_FILES
        JsonListModel.qml JsonBackend.qml
    PUBLIC_LIBRARIES
        Qt::Qml
        Qt::Quick
)
