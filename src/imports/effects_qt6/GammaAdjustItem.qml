// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property alias gamma: gammaAdjust.gamma
    property alias cached: gammaAdjust.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack
        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y

        visible: false
    }

    GammaAdjust {
        id: gammaAdjust
        anchors.fill: stack
        source: stack
        gamma: 0.5
    }
}
