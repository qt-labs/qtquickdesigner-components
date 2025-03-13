map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/ArcArrow.qml
    ${MIRROR_DIR}/ArcItem.qml
    ${MIRROR_DIR}/BorderItem.qml
    ${MIRROR_DIR}/EllipseItem.qml
    ${MIRROR_DIR}/FlipableItem.qml
    ${MIRROR_DIR}/GroupItem.qml
    ${MIRROR_DIR}/PieItem.qml
    ${MIRROR_DIR}/RectangleItem.qml
    ${MIRROR_DIR}/RegularPolygonItem.qml
    ${MIRROR_DIR}/StarItem.qml
    ${MIRROR_DIR}/StraightArrow.qml
    ${MIRROR_DIR}/SvgPathItem.qml
    ${MIRROR_DIR}/TextItem.qml
    ${MIRROR_DIR}/TriangleItem.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioComponents
    URI "QtQuick.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    ${qds_qml_extra_args}
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_QML_FILES}
)

qt_internal_add_docs(QuickStudioComponents
    doc/qtquickstudiocomponents.qdocconf
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
