/******************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
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
import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtQuickUltralite.Extras 1.0

Image {
    id: img
    property var color: "transparent"

    layer.enabled: ImageChecker.isMonochrome(img.source)
    layer.effect: ColorOverlay {
        anchors.fill: img
        source: img
        color: img.color
    }
}
