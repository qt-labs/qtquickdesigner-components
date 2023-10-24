qt_internal_add_qml_module(QuickUltraLiteStudioComponents
    URI "QtQuickUltralite.Studio.Components"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS
        1
        2
    QML_FILES
        ArcItem.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()
