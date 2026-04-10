// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QQmlEngine>
#include <QQmlContext>
#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class StudioCompatibilityQULComponents: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    StudioCompatibilityQULComponents(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

StudioCompatibilityQULComponents::StudioCompatibilityQULComponents(QObject *parent)
    : QQmlExtensionPlugin(parent)
{
}

void StudioCompatibilityQULComponents::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "studiocompatibilityqulcomponents.moc"
