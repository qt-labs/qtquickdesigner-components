// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#ifndef QUICKSTUDIOUTILS_P_H
#define QUICKSTUDIOUTILS_P_H

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

class QFileSystemWatcher;

class QuickStudioFileReader : public QObject
{
    Q_OBJECT

    QML_NAMED_ELEMENT(FileReader)
    QML_ADDED_IN_VERSION(6, 2)

    Q_PROPERTY(QUrl filePath READ filePath WRITE setFilePath NOTIFY filePathChanged)
    Q_PROPERTY(QString content READ content NOTIFY contentChanged)

public:
    explicit QuickStudioFileReader(QObject *parent = nullptr);

    const QUrl filePath() { return m_filePath; }
    void setFilePath(const QUrl &file);

    const QString content() { return m_content; }

signals:
    void filePathChanged();
    void contentChanged();

private:
    QString loadFile(const QString &path);
    void reload();

    QUrl m_filePath;
    QString m_content;
    QFileSystemWatcher *m_watcher = nullptr;
};

QT_END_NAMESPACE

QML_DECLARE_TYPE(QuickStudioFileReader)

#endif // QUICKSTUDIOUTILS_P_H
