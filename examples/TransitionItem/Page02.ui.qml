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

/*##^##
Designer {
    D{i:0;height:480;width:640}
}
##^##*/

