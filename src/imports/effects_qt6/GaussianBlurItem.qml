// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property real deviation: gaussianBlur.deviation
    property alias radius: gaussianBlur.radius
    property int samples: 0
    property alias transparentBorder: gaussianBlur.transparentBorder
    property alias cached: gaussianBlur.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
        visible: false
    }

    FastBlur {
        id: gaussianBlur
        transparentBorder: true
        anchors.fill: stack
        source: stack
        radius: 8.0
    }
    Component.onCompleted: console.log("GaussianBlur is not supported with Qt 6")
}
