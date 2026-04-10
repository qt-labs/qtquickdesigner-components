// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

FastBlur {
    id: maskedBlur
    radius: 32
    property int samples: 0
    Component.onCompleted: console.log("MaskedBlur is not supported with Qt 6")
}
