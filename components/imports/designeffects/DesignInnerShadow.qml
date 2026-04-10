// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls

QtObject {
    property real blur: 4
    property int offsetX: 0
    property int offsetY: 4
    property int spread: 0
    property color color: "#3f000000" // black 25%
    property bool showBehind: false // This is a dummy property mirroring DropShadow
    property bool visible: true

    property string type: "InnerShadow"
}
