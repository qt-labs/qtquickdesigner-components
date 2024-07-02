/****************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Dialogs module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#include "quickstudiofilereader_p.h"

#include <QDir>
#include <QDirIterator>
#include <QFileSystemWatcher>
#include <QLoggingCategory>

QT_BEGIN_NAMESPACE

static Q_LOGGING_CATEGORY(quickStudioFileReaderDebug, "qt.Studiofilereader.debug", QtDebugMsg)

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

    return file.readAll();
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
