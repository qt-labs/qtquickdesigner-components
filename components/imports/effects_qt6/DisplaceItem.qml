// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias displacement: displace.displacement
    property alias cached: displace.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        implicitWidth: displace.source.width + displace.source.x
        implicitHeight: displace.source.height + displace.source.y
        visible: false
    }

    Displace {
        id: displace
        anchors.fill: parent
        source: root.background
        displacementSource: root.foreground
    }

    property Item background
    property Item foreground

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
    }
}

