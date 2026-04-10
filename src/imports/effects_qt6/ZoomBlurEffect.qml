// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

FastBlur {
    id: zoomBlur
    property int zoomBlurLength: 0
    property int zoomBlurSamples: 0
    property real zoomBlurHoffset: 0
    property real zoomBlurVoffset: 0
    transparentBorder: true
    Component.onCompleted: console.log("ZoomBlur is not supported with Qt 6")
}
