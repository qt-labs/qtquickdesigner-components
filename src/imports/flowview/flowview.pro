TEMPLATE = aux
TARGETPATH = FlowView
IMPORT_VERSION = 1.0

QT += qml quick
QT_PRIVATE += core-private gui-private qml-private quick-private quicktemplates2-private quickcontrols2-private

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

include(flowview.pri)

OTHER_FILES += \
    qmldir \

AUX_QML_FILES += \
    $$PWD/designer/plugin.metainfo

SOURCES += \
    $$PWD/qtstudioflowviewplugin.cpp

## !static: qtConfig(quick-designer): include(designer/designer.pri)
## include(doc/doc.pri)

CONFIG += no_cxx_module install_qml_files qtquickcompiler
load(qml_plugin)
