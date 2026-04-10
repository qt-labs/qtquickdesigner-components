// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias spread: thresholdMask.spread
    property alias threshold: thresholdMask.threshold
    property alias cached: thresholdMask.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        z: -1
        id: stack
        implicitWidth: thresholdMask.source.width + thresholdMask.source.x
        implicitHeight: thresholdMask.source.height + thresholdMask.source.y
        visible: false
    }

    ThresholdMask {
        id: thresholdMask
        anchors.fill: parent
        source: root.background
        maskSource: root.foreground
        spread: 0.2
        threshold: 0.5
    }

    property Item background
    property Item foreground

    Component.onCompleted: {
        root.background = stack.children[0]
        root.foreground = stack.children[1]
    }
}
