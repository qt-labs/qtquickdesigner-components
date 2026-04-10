// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#include "quickstudiofilereader.h"

#include <QDir>
#include <QDirIterator>
#include <QFileSystemWatcher>
#include <QLoggingCategory>

QT_BEGIN_NAMESPACE

#ifndef Q_STATIC_LOGGING_CATEGORY // introduced with Qt 6.9
static Q_LOGGING_CATEGORY(quickStudioFileReaderDebug, "qt.Studioapplication.debug", QtDebugMsg)
#else
Q_STATIC_LOGGING_CATEGORY(quickStudioFileReaderDebug, "qt.Studiofilereader.debug", QtDebugMsg)
#endif

QuickStudioFileReader::QuickStudioFileReader(QObject *parent)
    : QObject(parent)
{}

QString QuickStudioFileReader::loadFile(const QString &path)
{
    qCDebug(quickStudioFileReaderDebug) << Q_FUNC_INFO << "Load file: " << path;

    QFile file(path);
    bool ok = file.open(QIODevice::ReadOnly);

    if (!ok) {
        qWarning() << "File cannot be opened:" << file.errorString();
        return {};
    }

    if (m_watcher)
        m_watcher->deleteLater();

    m_watcher = new QFileSystemWatcher({path}, this);

    connect(m_watcher, &QFileSystemWatcher::fileChanged, this, &QuickStudioFileReader::reload);

    return QString::fromUtf8(file.readAll());
}

void QuickStudioFileReader::reload()
{
    qCDebug(quickStudioFileReaderDebug) << Q_FUNC_INFO << "Load file: " << m_filePath;

    QString localPath;

    if (m_filePath.isLocalFile())
        localPath = m_filePath.toLocalFile();

    if (m_filePath.scheme() == QStringLiteral("qrc")) {
        const QString &path = m_filePath.path();
        localPath = QStringLiteral(":") + path;
    }

    QString newContent = loadFile(localPath);

    if (newContent != m_content) {
        m_content = newContent;
        emit contentChanged();
    }
}

void QuickStudioFileReader::setFilePath(const QUrl &url)
{
    if (url == filePath())
        return;

    m_filePath = url;

    reload();

    emit filePathChanged();
}

QT_END_NAMESPACE
