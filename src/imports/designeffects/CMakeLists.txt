qt_add_library(QuickStudioDesignEffects STATIC)
qt6_add_qml_module(QuickStudioDesignEffects
    URI "QtQuick.Studio.DesignEffects"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    RESOURCE_PREFIX "/qt-project.org/imports"
    PAST_MAJOR_VERSIONS 1
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

set_target_properties(QuickStudioDesignEffects PROPERTIES
QT_QMLCACHEGEN_EXECUTABLE qmlcachegen
)

find_package(Qt6 COMPONENTS ShaderTools)

qt6_add_shaders(QuickStudioDesignEffects "designeffectsshaders"
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

