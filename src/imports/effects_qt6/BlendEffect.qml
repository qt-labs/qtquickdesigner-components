// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

FastBlur {
    id: blend
    property string mode: "subtract"
    Component.onCompleted: console.log("Blend is not supported with Qt 6")
}
