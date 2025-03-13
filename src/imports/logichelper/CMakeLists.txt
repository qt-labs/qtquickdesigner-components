map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/BidirectionalBinding.qml
    ${MIRROR_DIR}/RangeMapper.qml
    ${MIRROR_DIR}/MinMaxMapper.qml
    ${MIRROR_DIR}/StringMapper.qml
    ${MIRROR_DIR}/OrOperator.qml
    ${MIRROR_DIR}/AndOperator.qml
    ${MIRROR_DIR}/NotOperator.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioLogicHelper
    URI "QtQuick.Studio.LogicHelper"
    VERSION "${PROJECT_VERSION}"
    ${qds_qml_extra_args}
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_QML_FILES}
)

qt_internal_add_docs(QuickStudioLogicHelper
    doc/qtquickstudiologichelper.qdocconf
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

