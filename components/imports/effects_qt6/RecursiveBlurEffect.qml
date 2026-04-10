// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

FastBlur {
    id: recursiveBlur
    transparentBorder: true
    radius: 8.0
    property int loops: 0
    property int progress: 0
    Component.onCompleted: console.log("RecursiveBlur is not supported with Qt 6")
}
