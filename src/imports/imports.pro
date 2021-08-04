TEMPLATE = subdirs
SUBDIRS += \
    components \
    effects \
    flowview \
    multitext \
    tools \
    logichelper \
    compatibility

equals(QT_MAJOR_VERSION , 5){
    SUBDIRS += effects
}
equals(QT_MAJOR_VERSION , 6) {
    SUBDIRS += effects_qt6
}
