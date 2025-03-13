map_to_components(${CMAKE_CURRENT_SOURCE_DIR} MIRROR_DIR)

set(MIRROR_QML_FILES
    ${MIRROR_DIR}/FastBlurItem.qml
    ${MIRROR_DIR}/GlowItem.qml
    ${MIRROR_DIR}/ZoomBlurItem.qml
    ${MIRROR_DIR}/RadialBlurItem.qml
    ${MIRROR_DIR}/DesaturationItem.qml
    ${MIRROR_DIR}/SaturationItem.qml
    ${MIRROR_DIR}/DirectionalBlurItem.qml
    ${MIRROR_DIR}/ColorOverlayItem.qml
    ${MIRROR_DIR}/DropShadowItem.qml
    ${MIRROR_DIR}/ColorizeItem.qml
    ${MIRROR_DIR}/BrightnessContrastItem.qml
    ${MIRROR_DIR}/HueSaturationItem.qml
    ${MIRROR_DIR}/MaskedBlurItem.qml
    ${MIRROR_DIR}/BlendItem.qml
    ${MIRROR_DIR}/OpacityMaskItem.qml
    ${MIRROR_DIR}/MaskItem.qml
    ${MIRROR_DIR}/RotationItem.qml
    ${MIRROR_DIR}/GaussianBlurItem.qml
    ${MIRROR_DIR}/GammaAdjustItem.qml
    ${MIRROR_DIR}/RecursiveBlurItem.qml
    ${MIRROR_DIR}/ThresholdMaskItem.qml
    ${MIRROR_DIR}/LevelAdjustItem.qml
    ${MIRROR_DIR}/InnerShadowItem.qml
    ${MIRROR_DIR}/DisplaceItem.qml
    ${MIRROR_DIR}/BlendEffect.qml
    ${MIRROR_DIR}/BrightnessContrastEffect.qml
    ${MIRROR_DIR}/ColorizeEffect.qml
    ${MIRROR_DIR}/ColorOverlayEffect.qml
    ${MIRROR_DIR}/DesaturationEffect.qml
    ${MIRROR_DIR}/DirectionalBlurEffect.qml
    ${MIRROR_DIR}/DisplaceEffect.qml
    ${MIRROR_DIR}/DropShadowEffect.qml
    ${MIRROR_DIR}/FastBlurEffect.qml
    ${MIRROR_DIR}/GammaAdjustEffect.qml
    ${MIRROR_DIR}/GaussianBlurEffect.qml
    ${MIRROR_DIR}/GlowEffect.qml
    ${MIRROR_DIR}/HueSaturationEffect.qml
    ${MIRROR_DIR}/InnerShadowEffect.qml
    ${MIRROR_DIR}/LevelAdjustEffect.qml
    ${MIRROR_DIR}/MaskedBlurEffect.qml
    ${MIRROR_DIR}/OpacityMaskEffect.qml
    ${MIRROR_DIR}/RadialBlurEffect.qml
    ${MIRROR_DIR}/RecursiveBlurEffect.qml
    ${MIRROR_DIR}/ThresholdMaskEffect.qml
    ${MIRROR_DIR}/ZoomBlurEffect.qml
)

set_qml_resource_aliases(${MIRROR_QML_FILES})

qt_internal_add_qml_module(QuickStudioEffects
    URI "QtQuick.Studio.Effects"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    ${qds_qml_extra_args}
    QML_FILES
        ${MIRROR_QML_FILES}
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
