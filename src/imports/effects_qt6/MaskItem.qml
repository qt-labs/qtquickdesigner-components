// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias invert: blend.invert

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        implicitWidth: blend.source.width + blend.source.x
        implicitHeight: blend.source.height + blend.source.y

        visible: false
    }

    OpacityMask  {
        id: blend
        anchors.fill: parent
        source: root.background
        maskSource: root.foreground

    }

    property Item background
    property Item foreground

    property Item foo: Item {}

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
    }
}

