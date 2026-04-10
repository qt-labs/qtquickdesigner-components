// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias cached: innerShadow.cached

    property color color: "#000000"
    property bool fast: false
    property real horizontalOffset: 0
    property real radius: 0
    property real samples: 0
    property real spread: 0
    property real verticalOffset: 0

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
        visible: false
    }

    FastBlur {
        id: innerShadow
        anchors.fill: stack
        source: stack
    }
    Component.onCompleted: console.log("InnerShadow is not supported with Qt 6")
}
