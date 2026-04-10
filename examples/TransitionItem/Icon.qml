// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0

Item {
    id: element1
    width: 196
    height: 196
    property alias text: element.text
    property string identifer: "069"
    Rectangle {
        id: rectangle
        x: -2
        y: -2
        color: "#a6a6a6"
        radius: 16
        clip: true
        anchors.rightMargin: -2
        anchors.leftMargin: -2
        anchors.bottomMargin: -2
        anchors.topMargin: -2
        anchors.fill: parent
        z: -1

        Rectangle {
            id: rectangle1
            x: -48
            y: -48
            width: 300
            height: 300
            rotation: 45
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#33b2bc62"
                }

                GradientStop {
                    position: 1
                    color: "#cc0f4274"
                }
            }
        }
    }

    onIdentiferChanged: {
        textLabel.text = String.fromCharCode(parseInt(identifer, 16))
    }
    Text {
        id: textLabel
        width: 196
        height: 196
        renderType: Text.NativeRendering

        FontLoader {
            id: fontLoader
            source: "FontAwesome.otf"
        }
        font.family: fontLoader.name
        text: "\uf069"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        styleColor: "#868686"
        style: Text.Sunken
        font.pixelSize: 182
        color: "#dddddd"
    }

    Text {
        id: element
        color: "#dddddd"
        text: qsTr("Text")
        font.bold: true
        anchors.bottomMargin: -56
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        font.pixelSize: 32
    }
}
