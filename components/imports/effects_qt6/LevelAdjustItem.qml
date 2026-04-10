// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property real gammaR: 1.0
    property real gammaG: 1.0
    property real gammaB: 1.0
    property alias maximumInput: levelAdjust.maximumInput
    property alias maximumOutput: levelAdjust.maximumOutput
    property alias minimumInput: levelAdjust.minimumInput
    property alias minimumOutput: levelAdjust.minimumOutput
    property alias cached: levelAdjust.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
        visible: true
    }

    LevelAdjust {
        id: levelAdjust
        anchors.fill: stack
        source: stack
        gamma: Qt.vector3d(root.gammaR, root.gammaG, root.gammaG)
    }
}
