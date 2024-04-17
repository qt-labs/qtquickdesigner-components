qt_add_library(QuickStudioLogicHelper STATIC)
qt6_add_qml_module(QuickStudioLogicHelper
    URI "QtQuick.Studio.LogicHelper"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    QML_FILES
        BidirectionalBinding.qml
        RangeMapper.qml
        MinMaxMapper.qml
        StringMapper.qml
        OrOperator.qml
        AndOperator.qml
        NotOperator.qml
)


