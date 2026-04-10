// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property string mode
    property alias cached: blend.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        visible: false
    }

    FastBlur {
        id: blend
        anchors.fill: parent
    }

    property Item background
    property Item foreground

    property Item foo: Item {}

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
        console.log("Blend is not supported with Qt 6")
    }
}

