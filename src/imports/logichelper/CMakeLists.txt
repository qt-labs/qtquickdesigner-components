qt6_add_qml_module(QuickStudioLogicHelper
    URI "QtQuick.Studio.LogicHelper"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
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


