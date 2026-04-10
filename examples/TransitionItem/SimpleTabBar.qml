// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
import TransitionItem 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0

Row {
    spacing: 40
    property var list
    Repeater {
        model: list.length

        Text {
            color: list.currentItem === list.items[modelData] ? "white" : "#bfbfbf"
            text: list.items[modelData].objectName
            font.pointSize: 24
            MouseArea {
                anchors.fill: parent
                onClicked: list.currentItem = list.items[modelData]
            }
        }
    }
}
