#####################################################################
## QuickStudioApplicationModule:
#####################################################################

qt_internal_add_qml_module(QuickStudioApplication
    URI "QtQuick.Studio.Application"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
 INCLUDE_DIRECTORIES
    ${CMAKE_CURRENT_SOURCE_DIR}
    SOURCES
        quickstudioapplication.cpp quickstudioapplication_p.h
    PUBLIC_LIBRARIES
        Qt::Qml
        Qt::Quick
)
