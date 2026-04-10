// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
import Qt5Compat.GraphicalEffects
//! [ColorizedImage compatibility]
//  Displays a colorized image.
Item {
    id: colorizedRoot
    implicitHeight: img.implicitHeight
    implicitWidth: img.implicitWidth

    property alias color: colorize.color
    property alias source: img.source
    property alias fillMode: img.fillMode
    property alias horizontalAlignment: img.horizontalAlignment
    property alias verticalAlignment: img.verticalAlignment

    Image {
        id: img
        anchors.fill: parent
        visible: false
    }

    ColorOverlay {
        id: colorize
        anchors.fill: img
        color: "transparent"
        source: img
    }
}
//! [ColorizedImage compatibility]
