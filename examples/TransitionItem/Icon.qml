/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
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
