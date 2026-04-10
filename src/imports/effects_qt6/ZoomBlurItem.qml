// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Qt5Compat.GraphicalEffects

Item {
    id: root

    default property alias contentStack: stack.children
    property int zoomBlurLength: 0
    property int zoomBlurSamples: 0
    property real zoomBlurHoffset: 0
    property real zoomBlurVoffset: 0
    property alias cached: zoomBlur.cached
    property alias transparentBorder: zoomBlur.transparentBorder

    implicitWidth: Math.max(32, stack.implicitWidth)
    implicitHeight: Math.max(32, stack.implicitHeight)

    Item {
        id: stack

        implicitWidth: childrenRect.width + childrenRect.x
        implicitHeight: childrenRect.height + childrenRect.y
    }

    FastBlur {
        id: zoomBlur
        anchors.fill: stack
        source: stack
        transparentBorder: true
    }
    Component.onCompleted: console.log("ZoomBlur is not supported with Qt 6")
}
