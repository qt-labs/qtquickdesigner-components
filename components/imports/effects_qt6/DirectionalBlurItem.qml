// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children

    property real directionalBlurAngle: 0
    property real directionalBlurLength: 0
    property int directionalBlurSamples: 10
    property alias directionalBlurBorder: directionalBlur.transparentBorder
    property alias cached: directionalBlur.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y

        visible: false
    }

    FastBlur {
        id: directionalBlur
        anchors.fill: stack
        source: stack
        transparentBorder: true
    }
    Component.onCompleted: console.log("DirectionalBlur is not supported with Qt 6")
}
