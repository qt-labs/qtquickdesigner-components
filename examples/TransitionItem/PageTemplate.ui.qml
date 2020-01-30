
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

/*##^##
Designer {
    D{i:0;height:480;width:640}D{i:2;anchors_width:200}D{i:6;anchors_width:200}D{i:1;anchors_height:200;anchors_width:200}
}
##^##*/

