/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
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

#include "quickstudioapplication_p.h"

#include <QDir>
#include <QDirIterator>
#include <QFontDatabase>
#include <QLoggingCategory>

QT_BEGIN_NAMESPACE

static Q_LOGGING_CATEGORY(texttomodelMergerDebug, "qt.Studioapplication.debug", QtDebugMsg)

QuickStudioApplication::QuickStudioApplication(QObject *parent) : QObject(parent) {}

static void loadFont(const QString &path)
{
    qCDebug(texttomodelMergerDebug) << Q_FUNC_INFO << "Load font: " << path;
    QFontDatabase::addApplicationFont(path);
}

void QuickStudioApplication::setFontPath(const QUrl &url)
{
    if (url == fontPath())
        return;

    m_fontPath = url;

    QString localPath;

    if (url.isLocalFile())
        localPath = url.toLocalFile();

    if (url.scheme() == QStringLiteral("qrc")) {
        const QString &path = url.path();
        localPath = QStringLiteral(":") + path;
    }

    if (!localPath.isEmpty()) {
        QDirIterator it(localPath,
                        {QStringLiteral("*.ttf"), QStringLiteral("*.otf")},
                        QDir::Files,
                        QDirIterator::Subdirectories);

        while (it.hasNext())
            loadFont(it.next());
    }

    emit fontPathChanged();
}

QT_END_NAMESPACE
