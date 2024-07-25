set_source_files_properties(FlowState.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

option(FLOWVIEW_AUTO_QMLDIR "Enable auto-generation of QMLDIR for FlowView" OFF)

if(NOT DEFINED FLOWVIEW_AUTO_QMLDIR)
    list(qds_qml_extra_args NO_GENERATE_QMLDIR RESOURCES qmldir)
else()
    message(WARNING "Auto-generating qmldir for FlowView and skiping the provided one.")
endif()

qt_internal_add_qml_module(FlowView
    URI "FlowView"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    ${qds_qml_extra_args}
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
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
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
