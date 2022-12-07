#####################################################################
## QuickStudioApplicationModule:
#####################################################################

qt6_add_qml_module(QuickStudioApplication
    URI "QtQuick.Studio.Application"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    SOURCES
        quickstudioapplication.cpp quickstudioapplication_p.h
)

target_link_libraries(QuickStudioApplication PRIVATE Qt6::Gui)
