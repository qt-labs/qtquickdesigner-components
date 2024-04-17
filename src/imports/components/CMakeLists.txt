qt_internal_add_qml_module(QuickStudioComponents
    URI "QtQuick.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    ${qds_qml_extra_args}
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
        QML_FILES
        ArcItem.qml
        PieItem.qml
        TriangleItem.qml
        SvgPathItem.qml
        EllipseItem.qml
        FlipableItem.qml
        RectangleItem.qml
        RegularPolygonItem.qml
        BorderItem.qml
        IsoItem.qml
        GroupItem.qml
        ArcArrow.qml
        StraightArrow.qml
)

qt_internal_add_docs(QuickStudioComponents
    doc/qtquickstudiocomponents.qdocconf
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

