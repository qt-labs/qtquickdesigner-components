// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowItem {
    id: page01
    width: 640
    height: 480

    PageTemplate {
        id: pageTemplate
        anchors.fill: parent

        Rectangle {
            id: rectangle
            x: 156
            y: 175
            width: 328
            height: 42
            color: "#323244"
        }

        Rectangle {
            id: rectangle1
            x: 126
            y: 260
            width: 389
            height: 42
            color: "#323244"
        }

        Rectangle {
            id: rectangle2
            x: 257
            y: 349
            width: 127
            height: 42
            color: "#ffffff"
            border.width: 4
            border.color: "#323244"

            Text {
                id: element
                text: qsTr("Text")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.bold: true
                font.family: "Verdana"
                font.pixelSize: 28
            }
        }
    }
}
