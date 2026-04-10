// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias content: stack.children

    property alias overlayColor: colorOverlay.color
    property alias cached: colorOverlay.cached

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack

        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y

        visible: false
    }

    ColorOverlay {
        id: colorOverlay
        anchors.fill: stack
        source: stack
        color: "#80fff000"
    }
}
