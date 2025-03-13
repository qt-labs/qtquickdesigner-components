map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/DesignBackgroundBlurPrivate.qml
    ${MIRROR_DIR}/DesignDropShadow.qml
    ${MIRROR_DIR}/DesignDropShadowPrivate.qml
    ${MIRROR_DIR}/DesignEffect.qml
    ${MIRROR_DIR}/DesignEffectPrivate.qml
    ${MIRROR_DIR}/DesignInnerShadow.qml
    ${MIRROR_DIR}/DesignInnerShadowPrivate.qml
    ${MIRROR_DIR}/DesignLayerBlurPrivate.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioDesignEffects
    URI "QtQuick.Studio.DesignEffects"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    ${qds_qml_extra_args}
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        ${MIRROR_QML_FILES}
)

set(MIRROR_SHADERS
    ${MIRROR_DIR}/shaders/dropShadow.frag
    ${MIRROR_DIR}/shaders/dropShadowClip.frag
    ${MIRROR_DIR}/shaders/gaussianBlur.frag
    ${MIRROR_DIR}/shaders/innerShadow.frag
    ${MIRROR_DIR}/shaders/innerShadowClip.frag
    ${MIRROR_DIR}/shaders/opacityMask.frag
)

make_shader_outputs(${MIRROR_DIR} MIRROR_SHADERS SHADER_OUTPUTS)

qt_internal_add_shaders(QuickStudioDesignEffects "designeffectsshaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    PREFIX
        "/qt-project.org/imports/QtQuick/Studio/DesignEffects"
    FILES
        ${MIRROR_SHADERS}
    OUTPUTS
        ${SHADER_OUTPUTS}
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
