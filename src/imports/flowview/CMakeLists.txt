map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/DefaultFlowEffect.qml
    ${MIRROR_DIR}/SwipeInteraction.qml
    ${MIRROR_DIR}/FlowEffect.qml
    ${MIRROR_DIR}/FlowFadeEffect.qml
    ${MIRROR_DIR}/FlowPushLeftEffect.qml
    ${MIRROR_DIR}/FlowPushRightEffect.qml
    ${MIRROR_DIR}/FlowSlideDownEffect.qml
    ${MIRROR_DIR}/FlowSlideLeftEffect.qml
    ${MIRROR_DIR}/FlowSlideRightEffect.qml
    ${MIRROR_DIR}/FlowSlideUpEffect.qml
    ${MIRROR_DIR}/FlowMoveEffect.qml
    ${MIRROR_DIR}/FlowPushEffect.qml
    ${MIRROR_DIR}/FlowTransition.qml
    ${MIRROR_DIR}/FlowTransitionList.qml
    ${MIRROR_DIR}/FlowView.qml
    ${MIRROR_DIR}/FlowPushUpEffect.qml
    ${MIRROR_DIR}/FlowItem.qml
    ${MIRROR_DIR}/FlowDecision.qml
    ${MIRROR_DIR}/FlowWildcard.qml
    ${MIRROR_DIR}/FlowActionArea.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

set_source_files_properties(${MIRROR_DIR}/FlowState.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
        QT_RESOURCE_ALIAS "FlowState.qml"
)

set_source_files_properties(${MIRROR_DIR}/+DesignMode/FlowItem.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "+DesignMode/FlowItem.qml"
)

set_source_files_properties(${MIRROR_DIR}/+DesignMode/FlowView.qml
    PROPERTIES
        QT_RESOURCE_ALIAS "+DesignMode/FlowView.qml"
)

qt_internal_add_qml_module(FlowView
    URI "FlowView"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    ${qds_qml_extra_args}
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_QML_FILES}
        ${MIRROR_DIR}/FlowState.qml
        ${MIRROR_DIR}/+DesignMode/FlowItem.qml
        ${MIRROR_DIR}/+DesignMode/FlowView.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
