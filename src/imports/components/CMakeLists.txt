qt_add_library(QuickStudioComponents STATIC)
qt6_add_qml_module(QuickStudioComponents
    URI "QtQuick.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
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

set_target_properties(QuickStudioComponents PROPERTIES
QT_QMLCACHEGEN_EXECUTABLE qmlcachegen
)


