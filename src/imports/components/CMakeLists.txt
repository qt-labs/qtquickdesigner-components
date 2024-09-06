qt_internal_add_qml_module(QuickStudioComponents
    URI "QtQuick.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    ${qds_qml_extra_args}
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
        QML_FILES
        ArcArrow.qml
        ArcItem.qml
        BorderItem.qml
        EllipseItem.qml
        FlipableItem.qml
        GroupItem.qml
        PieItem.qml
        RectangleItem.qml
        RegularPolygonItem.qml
        StarItem.qml
        StraightArrow.qml
        SvgPathItem.qml
        TextItem.qml
        TriangleItem.qml
)

qt_internal_add_docs(QuickStudioComponents
    doc/qtquickstudiocomponents.qdocconf
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

