map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

qt_internal_add_qml_module(QuickStudioApplication
    URI "QtQuick.Studio.Application"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    INCLUDE_DIRECTORIES
        ${MIRROR_DIR}
    SOURCES
        ${MIRROR_DIR}/quickstudioapplication.cpp
        ${MIRROR_DIR}/quickstudioapplication.h
    PUBLIC_LIBRARIES
        Qt::Qml
        Qt::Quick
)
