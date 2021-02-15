/******************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Ultralite module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/

#pragma once

#include <QObject>

class ImageChecker : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(ImageChecker)

public:
    Q_INVOKABLE bool isMonochrome(const QUrl &imageProviderUrl);
    static ImageChecker *getInstance();

private:
    ImageChecker();

    QImage getImageFromProvider(const QUrl &url) const;
};