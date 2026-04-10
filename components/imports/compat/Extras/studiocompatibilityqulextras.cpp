// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QQmlEngine>
#include <QQmlContext>
#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class StudioCompatibilityQULExtras: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    StudioCompatibilityQULExtras(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

StudioCompatibilityQULExtras::StudioCompatibilityQULExtras(QObject *parent)
    : QQmlExtensionPlugin(parent)
{
}

void StudioCompatibilityQULExtras::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "studiocompatibilityqulextras.moc"
