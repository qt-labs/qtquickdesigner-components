// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class QtStudioEventSystemPlugin: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    QtStudioEventSystemPlugin(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

QtStudioEventSystemPlugin::QtStudioEventSystemPlugin(QObject *parent)
    : QQmlExtensionPlugin(parent)
{

}

void QtStudioEventSystemPlugin::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "qtstudioeventsystemplugin.moc"
