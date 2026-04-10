// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property int loops: 0
    property int progress: 0
    property alias radius: recursiveBlur.radius
    property alias transparentBorder: recursiveBlur.transparentBorder
    property alias cached: recursiveBlur.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
        visible: false
    }

    FastBlur {
        id: recursiveBlur
        transparentBorder: true
        anchors.fill: stack
        source: stack
        radius: 8.0
    }
    Component.onCompleted: console.log("RecursiveBlur is not supported with Qt 6")
}
