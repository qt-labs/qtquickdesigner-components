set_source_files_properties(QulPerf.qml
    PROPERTIES
        QT_QML_SINGLETON_TYPE true
)

qt_internal_add_qml_module(QuickUltraLiteStudioExtras
    URI "QtQuickUltralite.Extras"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS
        1
        2
    QML_FILES
        AnimatedSpriteDirectory.qml
        ColorizedImage.qml
        ItemBuffer.qml
        StaticText.qml
        QulPerf.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()


