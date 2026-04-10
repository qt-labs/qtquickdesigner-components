// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

FlowItem {
    id: page01
    width: 640
    height: 480

    PageTemplate {
        id: pageTemplate
        anchors.fill: parent

        Rectangle {
            id: rectangle
            x: 177
            y: 192
            width: 168
            height: 28
            color: "#ffffff"
            border.color: "#9d9d9d"
            border.width: 4
        }

        Rectangle {
            id: rectangle1
            x: 177
            y: 233
            width: 168
            height: 118
            color: "#ffffff"
            border.width: 4
            border.color: "#9d9d9d"
        }

        Rectangle {
            id: rectangle2
            x: 177
            y: 151
            width: 168
            height: 28
            color: "#ffffff"
            border.width: 4
            border.color: "#9d9d9d"
        }

        Rectangle {
            id: rectangle3
            x: 177
            y: 366
            width: 88
            height: 28
            color: "#323244"
            border.width: 4

            Text {
                id: element
                x: 30
                y: 3
                color: "#ffffff"
                text: qsTr("OK")
                font.bold: true
                font.family: "Verdana"
                font.pixelSize: 18
            }
        }
    }
}
