// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class QtStudioComponentsPlugin: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    QtStudioComponentsPlugin(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

QtStudioComponentsPlugin::QtStudioComponentsPlugin(QObject *parent)
    : QQmlExtensionPlugin(parent)
{
}

void QtStudioComponentsPlugin::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "qtstudiocomponentsplugin.moc"
