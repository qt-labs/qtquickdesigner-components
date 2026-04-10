// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

#include <QtQml/qqmlextensionplugin.h>

QT_BEGIN_NAMESPACE

class StudioCompatibilityQtAaActivityView: public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:
    StudioCompatibilityQtAaActivityView(QObject *parent = nullptr);
    void registerTypes(const char *uri) override;
};

StudioCompatibilityQtAaActivityView::StudioCompatibilityQtAaActivityView(QObject *parent)
    : QQmlExtensionPlugin(parent)
{
}

void StudioCompatibilityQtAaActivityView::registerTypes(const char *)
{
}

QT_END_NAMESPACE

#include "studiocompatibilityqaaactivityview.moc"
