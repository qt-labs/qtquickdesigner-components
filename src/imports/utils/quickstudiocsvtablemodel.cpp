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

#include "quickstudiocsvtablemodel_p.h"

#include <QColor>
#include <QFile>
#include <QFileInfo>
#include <QFileSystemWatcher>
#include <QLoggingCategory>
#include <QRegularExpression>
#include <QTextStream>

static inline QColor fromString(const QString &colorName)
{
#if QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)
    return QColor::fromString(colorName);
#else
    return colorName;
#endif // >= Qt 6.4
}

static inline bool isValidColorName(const QString &colorName)
{
#if QT_VERSION >= QT_VERSION_CHECK(6, 4, 0)
    return QColor::isValidColorName(colorName);
#else
    constexpr QStringView colorPattern(
        u"(?<color>^(?:#(?:(?:[0-9a-fA-F]{2}){3,4}|(?:[0-9a-fA-F]){3,4}))$)");
    static QRegularExpression colorRegex(colorPattern.toString());
    return colorRegex.match(colorName).hasMatch();
#endif // >= Qt 6.4
}

static QVariant stringToVariant(const QString &value)
{
    constexpr QStringView typesPattern{u"(?<boolean>^(?:true|false)$)|"
                                       u"(?<number>^(?:-?(?:0|[1-9]\\d*)?(?:\\.\\d*)?(?<=\\d|\\.)"
                                       u"(?:e-?(?:0|[1-9]\\d*))?|0x[0-9a-f]+)$)|"
                                       u"(?<color>^(?:#(?:(?:[0-9a-fA-F]{2}){3,4}|"
                                       u"(?:[0-9a-fA-F]){3,4}))$)"};

    static QRegularExpression validator(typesPattern.toString());
    const QString trimmedValue = value.trimmed();
    QRegularExpressionMatch match = validator.match(trimmedValue);

    if (!match.hasMatch())
        return value;

    if (!match.captured(u"boolean").isEmpty())
        return QVariant::fromValue<bool>(trimmedValue.at(0).toLower() == u't');

    if (!match.captured(u"number").isEmpty())
        return trimmedValue.toDouble();

    if (!match.captured(u"color").isEmpty())
        return ::fromString(trimmedValue);

    return value;
}

static QVariant stringToVariant(const QString &value, QMetaType::Type type, bool *ok = nullptr)
{
    if (type == QMetaType::Bool) {
        const QString lowerValue = value.toLower().trimmed();
        bool conversionOk = true;
        bool booleanValue = false;

        if (lowerValue == u"true")
            booleanValue = true;
        else if (lowerValue == u"false")
            booleanValue = false;
        else
            conversionOk = false;

        if (ok)
            *ok = conversionOk;

        if (conversionOk)
            return booleanValue;
    }

    if (type == QMetaType::Double) {
        bool conversionOk = false;
        double numericValue = value.toDouble(&conversionOk);
        if (ok)
            *ok = conversionOk;

        if (conversionOk)
            return numericValue;
    }

    if (type == QMetaType::QColor) {
        bool conversionOk = ::isValidColorName(value);
        if (ok)
            *ok = conversionOk;

        if (conversionOk)
            return ::fromString(value);
    }

    if (type == QMetaType::QString) {
        if (ok)
            *ok = !value.isEmpty();
    }

    return value;
}

static QString urlToLocalPath(const QUrl &url)
{
    QString localPath;

    if (url.isLocalFile())
        localPath = url.toLocalFile();

    if (url.scheme() == QLatin1String("qrc")) {
        const QString &path = url.path();
        localPath = QStringLiteral(":") + path;
    }

    return localPath;
}

static Q_LOGGING_CATEGORY(quickStudioCsvTableModelDebug, "qt.StudioCsvTableModel.debug", QtDebugMsg)

QuickStudioCsvTableModel::QuickStudioCsvTableModel(QObject *parent)
    : QAbstractTableModel(parent)
    , m_fileWatcher(new QFileSystemWatcher(this))
{
    connect(m_fileWatcher,
            &QFileSystemWatcher::fileChanged,
            this,
            &QuickStudioCsvTableModel::checkPathAndReload);
}

int QuickStudioCsvTableModel::rowCount([[maybe_unused]] const QModelIndex &parent) const
{
    return m_rows.size();
}

int QuickStudioCsvTableModel::columnCount([[maybe_unused]] const QModelIndex &parent) const
{
    return m_headers.size();
}

QVariant QuickStudioCsvTableModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return {};

    const QHash<int, QVariant> &recordData = m_rows.at(index.row());

    if (role == Qt::DisplayRole)
        return recordData.value(index.column()).toString();

    return recordData.value(index.column());
}

QVariant QuickStudioCsvTableModel::headerData(int section,
                                              Qt::Orientation orientation,
                                              [[maybe_unused]] int role) const
{
    if (orientation == Qt::Horizontal) {
        if (section > -1 && section < m_headers.size())
            return m_headers.at(section);
    } else if (orientation == Qt::Vertical) {
        if (section > -1 && section < m_rows.size())
            return section;
    }

    return {};
}

QUrl QuickStudioCsvTableModel::source() const
{
    return m_source;
}

void QuickStudioCsvTableModel::setSource(const QUrl &newSource)
{
    if (m_source == newSource)
        return;

    m_source = newSource;
    emit this->sourceChanged(m_source);

    startWatchingSource();
    reloadModel();
}

void QuickStudioCsvTableModel::reloadModel()
{
    beginResetModel();
    m_headers.clear();
    m_rows.clear();
    m_types.clear();
    m_columnIsClean.clear();

    QString filePath = ::urlToLocalPath(source());
    QFile sourceFile(filePath);

    if (!sourceFile.open(QFile::ReadOnly)) {
        qWarning() << "File cannot be opened:" << sourceFile.errorString();
        endResetModel();
        return;
    }

    QTextStream stream(&sourceFile);

    if (!stream.atEnd())
        m_headers = stream.readLine().split(u',', Qt::KeepEmptyParts);

    m_types.insert(0, m_headers.size(), QMetaType::UnknownType);
    m_columnIsClean.insert(0, m_headers.size(), true);

    if (!m_headers.isEmpty()) {
        while (!stream.atEnd()) {
            const QStringList recordDataList = stream.readLine().split(u',', Qt::KeepEmptyParts);
            int column = -1;
            QHash<int, QVariant> recordData;
            for (const QString &cellString : recordDataList) {
                if (++column == m_headers.size())
                    break;

                if (!cellString.size())
                    continue;

                const QMetaType::Type &type = m_types.at(column);

                QVariant cellData;
                if (type == QMetaType::UnknownType) {
                    cellData = stringToVariant(cellString);
                    m_types.replace(column, QMetaType::Type(cellData.typeId()));
                } else {
                    bool columnIsClean = m_columnIsClean.at(column);
                    bool *ok = columnIsClean ? &columnIsClean : nullptr;
                    cellData = stringToVariant(cellString, type, ok);
                    if (ok)
                        m_columnIsClean.replace(column, *ok);
                }
                recordData.insert(column, cellData);
            }
            m_rows.append(recordData);
        }
    }

    endResetModel();
}

void QuickStudioCsvTableModel::checkPathAndReload(const QString &path)
{
    QString sourceLocalPath = ::urlToLocalPath(source());
    if (path == sourceLocalPath)
        reloadModel();
}

void QuickStudioCsvTableModel::startWatchingSource()
{
    qCDebug(quickStudioCsvTableModelDebug) << Q_FUNC_INFO << "Load file: " << source();

    const QStringList oldWatchingFiles = m_fileWatcher->files();
    if (oldWatchingFiles.size())
        m_fileWatcher->removePaths(oldWatchingFiles);

    QString localPath = ::urlToLocalPath(source());
    if (QFileInfo(localPath).isFile())
        m_fileWatcher->addPath(localPath);
}
