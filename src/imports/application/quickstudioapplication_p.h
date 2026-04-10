// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#ifndef QUICKSTUDIOAPPLICATION_P_H
#define QUICKSTUDIOAPPLICATION_P_H

//
//  W A R N I N G
//  -------------
//
// This file is not part of the Qt API.  It exists purely as an
// implementation detail.  This header file may change from version to
// version without notice, or even be removed.
//
// We mean it.
//

#include <QtCore/qurl.h>
#include <QtQml/qqml.h>

QT_BEGIN_NAMESPACE

class QuickStudioApplication : public QObject
{
    Q_OBJECT

    QML_NAMED_ELEMENT(StudioApplication)
    QML_ADDED_IN_VERSION(6, 2)

     Q_PROPERTY(QUrl fontPath READ fontPath WRITE setFontPath NOTIFY fontPathChanged)

public:
    explicit QuickStudioApplication(QObject *parent = nullptr);

    const QUrl fontPath() { return m_fontPath; }
    void setFontPath(const QUrl &path);

signals:
    void fontPathChanged();

private:
    QUrl m_fontPath;

};

QT_END_NAMESPACE

QML_DECLARE_TYPE(QuickStudioApplication)

#endif // QUICKSTUDIOAPPLICATION_P_H
