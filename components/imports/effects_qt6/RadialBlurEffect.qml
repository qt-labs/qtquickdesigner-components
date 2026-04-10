// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

FastBlur {

    property int samples: 0
    property real verticalOffset: 0
    property real horizontalOffset: 0
    property real angle: 0

    id: radialBlur

    transparentBorder: true

    Component.onCompleted: console.log("RadiallBlur is not supported with Qt 6")
}
