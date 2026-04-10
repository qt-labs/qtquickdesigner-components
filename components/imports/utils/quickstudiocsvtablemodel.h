// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

#ifndef QUICKSTUDIOCSVTABLEMODEL_P_H
#define QUICKSTUDIOCSVTABLEMODEL_P_H

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

#include <QAbstractTableModel>
#include <QtCore/qurl.h>
#include <QtQml/qqml.h>

QT_BEGIN_NAMESPACE

class QFileSystemWatcher;
class QuickStudioCsvTableModel : public QAbstractTableModel
{
    Q_OBJECT

    QML_NAMED_ELEMENT(CsvTableModel)
    QML_ADDED_IN_VERSION(6, 2)

    Q_PROPERTY(QUrl source READ source WRITE setSource NOTIFY sourceChanged)

public:
    explicit QuickStudioCsvTableModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = {}) const override;
    int columnCount(const QModelIndex &parent = {}) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QVariant headerData(int section,
                        Qt::Orientation orientation,
                        int role = Qt::DisplayRole) const override;

    QUrl source() const;
    void setSource(const QUrl &newSource);

signals:
    void sourceChanged(const QUrl &url);

private slots:
    void reloadModel();
    void checkPathAndReload(const QString &path);

private:
    void startWatchingSource();

    QFileSystemWatcher *m_fileWatcher = nullptr;
    QUrl m_source;

    QStringList m_headers;
    QList<QHash<int, QVariant>> m_rows;
    QList<QMetaType::Type> m_types;
    QList<bool> m_columnIsClean;
};

QT_END_NAMESPACE

QML_DECLARE_TYPE(QuickStudioCsvTableModel)

#endif // QUICKSTUDIOCSVTABLEMODEL_P_H
