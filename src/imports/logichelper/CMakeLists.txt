qt_internal_add_qml_module(QuickStudioLogicHelper
    URI "QtQuick.Studio.LogicHelper"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        BidirectionalBinding.qml
        RangeMapper.qml
        MinMaxMapper.qml
        StringMapper.qml
        OrOperator.qml
        AndOperator.qml
        NotOperator.qml
)

qt_internal_add_docs(QuickStudioLogicHelper
    doc/qtquickstudiologichelper.qdocconf
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

