map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_SRC_FILES
    ${MIRROR_DIR}/quickstudiocsvtablemodel.cpp
    ${MIRROR_DIR}/quickstudiocsvtablemodel.h
    ${MIRROR_DIR}/quickstudiofilereader.cpp
    ${MIRROR_DIR}/quickstudiofilereader.h
)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/JsonListModel.qml
    ${MIRROR_DIR}/JsonBackend.qml
    ${MIRROR_DIR}/ChildListModel.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioUtils
    URI "QtQuick.Studio.Utils"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1 2
    DEPENDENCIES 
        QtCore/auto
        QtQml.Models/auto
    INCLUDE_DIRECTORIES
        ${MIRROR_DIR}
    SOURCES
        ${MIRROR_SRC_FILES}
    QML_FILES
        ${MIRROR_QML_FILES}
    PUBLIC_LIBRARIES
        Qt::Core
        Qt::Qml
        Qt::Quick
)
