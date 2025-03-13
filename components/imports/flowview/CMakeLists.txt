set_source_files_properties(FlowState.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_add_library(FlowView STATIC)
qt6_add_qml_module(FlowView
    URI "FlowView"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    NO_GENERATE_QMLDIR
    NO_LINT
    NO_CACHEGEN
    QML_FILES
        DefaultFlowEffect.qml
        SwipeInteraction.qml
        FlowEffect.qml
        FlowFadeEffect.qml
        FlowPushLeftEffect.qml
        FlowPushRightEffect.qml
        FlowSlideDownEffect.qml
        FlowSlideLeftEffect.qml
        FlowSlideRightEffect.qml
        FlowSlideUpEffect.qml
        FlowMoveEffect.qml
        FlowPushEffect.qml
        FlowTransition.qml
        FlowTransitionList.qml
        FlowView.qml
        FlowPushUpEffect.qml
        FlowItem.qml
        FlowDecision.qml
        FlowWildcard.qml
        FlowActionArea.qml
        FlowState.qml
        +DesignMode/FlowItem.qml
        +DesignMode/FlowView.qml
    RESOURCES
        qmldir
)

register_plugin(FlowView)
