// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias adjustHue: hueSat.hue
    property alias adjustSaturation: hueSat.saturation
    property alias adjustLightness: hueSat.lightness
    property alias cached: hueSat.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y

        visible: false
    }

    HueSaturation {
        id: hueSat
        anchors.fill: stack
        source: stack
        hue: 0.5
        saturation: 0.5
        lightness: 0.5
    }
}
