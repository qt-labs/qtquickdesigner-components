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

#include "ultralite_plugin.h"

#include "imagechecker.h"

#include <QQmlEngine>
#include <QQmlContext>

static QObject *imageCheckerSingletonTypeProvider(QQmlEngine *, QJSEngine *)
{
    return ImageChecker::getInstance();
}

void UltralitePlugin::registerTypes(const char *uri)
{
    qmlRegisterSingletonType<ImageChecker>(uri, 1, 0, "ImageChecker", imageCheckerSingletonTypeProvider);
}