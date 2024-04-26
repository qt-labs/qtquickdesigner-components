qt_internal_add_qml_module(QuickStudioDesignEffects
    URI "QtQuick.Studio.DesignEffects"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    ${qds_qml_extra_args}
    PAST_MAJOR_VERSIONS 1
        QML_FILES
        DesignBackgroundBlurPrivate.qml
        DesignDropShadow.qml
        DesignDropShadowPrivate.qml
        DesignEffect.qml
        DesignEffectPrivate.qml
        DesignInnerShadow.qml
        DesignInnerShadowPrivate.qml
        DesignLayerBlurPrivate.qml
)

qt_internal_add_shaders(QuickStudioDesignEffects "designeffectsshaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    PREFIX
        "/qt-project.org/imports/QtQuick/Studio/DesignEffects"
    FILES
        "shaders/dropShadow.frag"
        "shaders/dropShadowClip.frag"
        "shaders/gaussianBlur.frag"
        "shaders/innerShadow.frag"
        "shaders/innerShadowClip.frag"
        "shaders/opacityMask.frag"
)

#qt_internal_add_docs(QuickStudioComponents
#    doc/qtquickstudiodesigneffects.qdocconf
#)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
