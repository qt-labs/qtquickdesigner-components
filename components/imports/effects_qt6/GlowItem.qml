// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias radius: glow.radius
    property real samples: 0
    property alias spread: glow.spread
    property alias color: glow.color
    property alias transparentBorder: glow.transparentBorder
    property alias cached: glow.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
        visible: false
    }

    Glow {
        id: glow
        anchors.fill: stack
        radius: 5
        spread: 0.5
        color: "#ffffffff"
        transparentBorder: true
        source: stack
    }
}
