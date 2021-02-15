TARGET = QtQuickUltralitePlugin
TARGETPATH = QtQuick/Studio/Compatibility/QtQuickUltralite/Extras
IMPORT_VERSION = 1.0

QT += core qml quick
QT_PRIVATE += core-private gui-private qml-private quick-private quicktemplates2-private quickcontrols2-private

include(extras.pri)

OTHER_FILES += \
    qmldir \
    $$QML_FILES

SOURCES += \
    $$PWD/ultralite_plugin.cpp \
    $$PWD/imagechecker.cpp

HEADERS += \
    $$PWD/ultralite_plugin.h \
    $$PWD/imagechecker.h

!static: qtConfig(quick-designer): include(designer/designer.pri)
## include(doc/doc.pri)

CONFIG += no_cxx_module install_qml_files qtquickcompiler
load(qml_plugin)
