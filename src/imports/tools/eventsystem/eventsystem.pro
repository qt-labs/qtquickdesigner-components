TEMPLATE = aux
TARGETPATH = QtQuick/Studio/EventSystem
IMPORT_VERSION = 1.0

QT += qml quick
QT_PRIVATE += core-private gui-private qml-private quick-private quicktemplates2-private quickcontrols2-private

DEFINES += QT_NO_CAST_TO_ASCII QT_NO_CAST_FROM_ASCII

include(eventsystem.pri)

OTHER_FILES += \
    qmldir

SOURCES += \
    $$PWD/qtstudioeventsystemplugin.cpp

## !static: qtConfig(quick-designer): include(designer/designer.pri)
## include(doc/doc.pri)

CONFIG += no_cxx_module install_qml_files qtquickcompiler
load(qml_plugin)
