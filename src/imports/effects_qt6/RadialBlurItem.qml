// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias cached: radialBlur.cached
    property int samples: 0
    property real verticalOffset: 0
    property real horizontalOffset: 0
    property real transparentBorder: 0
    property real angle: 0

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack

        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
    }

    FastBlur {
        id: radialBlur
        anchors.fill: stack
        source: stack
        transparentBorder: true
    }

    Component.onCompleted: console.log("RadiallBlur is not supported with Qt 6")
}
