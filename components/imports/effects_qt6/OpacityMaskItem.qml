// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias invert: mask.invert
    property alias cached: mask.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        implicitWidth: mask.source.width + mask.source.x
        implicitHeight: mask.source.height + mask.source.y
        visible: false
    }

    OpacityMask {
        id: mask
        anchors.fill: parent
        source: root.background
        maskSource: root.foreground
    }

    property Item background
    property Item foreground

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
    }
}
