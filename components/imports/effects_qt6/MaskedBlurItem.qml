// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias radius: maskedBlur.radius
    property int samples: 0

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        implicitWidth: maskedBlur.source.width + maskedBlur.source.x
        implicitHeight: maskedBlur.source.height + maskedBlur.source.y
        visible: false
    }

    FastBlur {
        id: maskedBlur
        anchors.fill: parent
        source: root.background
        maskSource: root.foreground
        radius: 32
        samples: 16
    }

    property Item background
    property Item foreground

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
        console.log("MaskedBlur is not supported with Qt 6")
    }
}
