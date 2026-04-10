// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QQmlEngine>
#include <QQmlContext>
#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class StudioCompatibilityQULProfiling: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    StudioCompatibilityQULProfiling(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

StudioCompatibilityQULProfiling::StudioCompatibilityQULProfiling(QObject *parent)
    : QQmlExtensionPlugin(parent)
{
}

void StudioCompatibilityQULProfiling::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "studiocompatibilityqulprofiling.moc"
