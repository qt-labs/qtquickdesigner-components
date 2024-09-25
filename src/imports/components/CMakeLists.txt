qt_add_library(QuickStudioComponents STATIC)
qt6_add_qml_module(QuickStudioComponents
    URI "QtQuick.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
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

set_target_properties(QuickStudioComponents PROPERTIES
QT_QMLCACHEGEN_EXECUTABLE qmlcachegen
)


