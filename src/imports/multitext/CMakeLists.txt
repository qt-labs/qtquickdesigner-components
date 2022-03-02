qt_internal_add_qml_module(QuickStudioMultiText
    URI "QtQuick.Studio.MultiText"
    VERSION "${PROJECT_VERSION}"
    DESIGNER_SUPPORTED
    NO_SYNC_QT
    PAST_MAJOR_VERSIONS 1
    QML_FILES
        MultiTextElement.qml
        MultiTextItem.qml
        MultiTextException.qml
)

if(QT_FEATURE_quick_designer AND QT_BUILD_SHARED_LIBS)
    add_subdirectory(designer)
endif()

