qt_add_library(QuickStudioEffects STATIC)
qt6_add_qml_module(QuickStudioEffects
    URI "QtQuick.Studio.Effects"
    VERSION "${PROJECT_VERSION}"
    RESOURCE_PREFIX "/qt-project.org/imports"
    DESIGNER_SUPPORTED
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    NO_LINT
    NO_CACHEGEN
    QML_FILES
        FastBlurItem.qml
        GlowItem.qml
        ZoomBlurItem.qml
        RadialBlurItem.qml
        DesaturationItem.qml
        SaturationItem.qml
        DirectionalBlurItem.qml
        ColorOverlayItem.qml
        DropShadowItem.qml
        ColorizeItem.qml
        BrightnessContrastItem.qml
        HueSaturationItem.qml
        MaskedBlurItem.qml
        BlendItem.qml
        OpacityMaskItem.qml
        MaskItem.qml
        RotationItem.qml
        GaussianBlurItem.qml
        GammaAdjustItem.qml
        RecursiveBlurItem.qml
        ThresholdMaskItem.qml
        LevelAdjustItem.qml
        InnerShadowItem.qml
        DisplaceItem.qml
        BlendEffect.qml
        BrightnessContrastEffect.qml
        ColorizeEffect.qml
        ColorOverlayEffect.qml
        DesaturationEffect.qml
        DirectionalBlurEffect.qml
        DisplaceEffect.qml
        DropShadowEffect.qml
        FastBlurEffect.qml
        GammaAdjustEffect.qml
        GaussianBlurEffect.qml
        GlowEffect.qml
        HueSaturationEffect.qml
        InnerShadowEffect.qml
        LevelAdjustEffect.qml
        MaskedBlurEffect.qml
        OpacityMaskEffect.qml
        RadialBlurEffect.qml
        RecursiveBlurEffect.qml
        ThresholdMaskEffect.qml
        ZoomBlurEffect.qml
)

set_target_properties(QuickStudioEffects PROPERTIES
QT_QMLCACHEGEN_EXECUTABLE qmlcachegen
)



