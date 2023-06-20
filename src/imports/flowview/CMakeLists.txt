set_source_files_properties(FlowState.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_internal_add_qml_module(FlowView
    URI "FlowView"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    NO_GENERATE_QMLDIR
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

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

