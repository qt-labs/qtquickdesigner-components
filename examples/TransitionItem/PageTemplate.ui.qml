// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.4

Item {
    width: 400
    height: 400

    Rectangle {
        id: rectangle
        color: "#ffffff"
        radius: 1
        border.width: 4
        border.color: "#9d9d9d"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            y: 32
            height: 4
            color: "#9d9d9d"
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Rectangle {
            id: rectangle2
            x: 8
            y: 10
            width: 16
            height: 16
            color: "#9d9d9d"
            radius: 8
        }

        Rectangle {
            id: rectangle3
            x: 30
            y: 10
            width: 16
            height: 16
            color: "#9d9d9d"
            radius: 8
        }

        Rectangle {
            id: rectangle4
            x: 52
            y: 10
            width: 16
            height: 16
            color: "#9d9d9d"
            radius: 8
        }

        Rectangle {
            id: rectangle5
            x: -2
            y: 14
            height: 8
            color: "#9d9d9d"
            radius: 2
            anchors.rightMargin: 8
            anchors.leftMargin: 80
            anchors.right: parent.right
            anchors.left: parent.left
        }
    }
}
