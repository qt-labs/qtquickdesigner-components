// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

FastBlur {
    id: gaussianBlur
    transparentBorder: true
    radius: 8.0

    property alias radius: gaussianBlur.radius
    property int samples: 0
    Component.onCompleted: console.log("GaussianBlur is not supported with Qt 6")
}
