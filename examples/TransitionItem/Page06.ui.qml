import QtQuick 2.12


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
            x: 40
            y: 328
            width: 200
            height: 24
            color: "#323244"
        }

        Rectangle {
            id: rectangle1
            x: 40
            y: 358
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle2
            x: 70
            y: 358
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle3
            x: 40
            y: 388
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle4
            x: 70
            y: 388
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle5
            x: 40
            y: 418
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle6
            x: 70
            y: 418
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle7
            x: 40
            y: 448
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle8
            x: 70
            y: 448
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle9
            x: 40
            y: 104
            width: 200
            height: 24
            color: "#323244"
        }

        Rectangle {
            id: rectangle10
            x: 40
            y: 134
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle11
            x: 70
            y: 134
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle12
            x: 40
            y: 164
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle13
            x: 70
            y: 164
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle14
            x: 40
            y: 194
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle15
            x: 70
            y: 194
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle16
            x: 40
            y: 224
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle17
            x: 70
            y: 224
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle18
            x: 40
            y: 254
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle19
            x: 70
            y: 254
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle20
            x: 40
            y: 284
            width: 24
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle21
            x: 70
            y: 284
            width: 283
            height: 24
            color: "#9d9d9d"
            radius: 12
        }

        Rectangle {
            id: rectangle22
            x: 388
            y: 104
            width: 176
            height: 131
            color: "#9d9d9d"
        }

        Rectangle {
            id: rectangle23
            x: 388
            y: 322
            width: 176
            height: 134
            color: "#9d9d9d"
        }

        Text {
            id: element
            x: 252
            y: 48
            text: qsTr("Contacts")
            font.bold: true
            font.family: "Verdana"
            font.pixelSize: 28
        }
    }
}

/*##^##
Designer {
    D{i:0;height:480;width:640}
}
##^##*/

