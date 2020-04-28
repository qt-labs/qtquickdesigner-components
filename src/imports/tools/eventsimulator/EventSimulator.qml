/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
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

pragma Singleton
import QtQuick 2.10
import QtQuick.Window 2.2
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root
    property ListModel model
    property font font: {
        family: "Verdana"
        bold: true
    }

    property color cellColor: "#323244"
    property color borderColor: "black"
    property color textColor: "white"
    property color backgroundColor: "darkgrey"
    property alias listView: list

    function show(x, y, width, height)
    {
        if (x !== undefined)
            eventDialog.x = x
        if (y !== undefined)
            eventDialog.y = y
        if (width !== undefined)
            eventDialog.width = width
        if (height !== undefined)
            eventDialog.height = height

        eventDialog.show()
        eventDialog.raise()
    }

    function hide()
    {
        eventDialog.hide()
        eventDialog.lower()
    }

    property Window eventDialog: Window {
        width: 500
        height: 1280
        color: root.backgroundColor

        ListView {
            id: list
            model: EventSystem.model
            anchors.fill: parent
            spacing: 2

            delegate:
                Rectangle {
                    id: wrapper
                    width: 200
                    height: 100
                    border.color: root.borderColor
                    border.width: 1
                    color: root.cellColor

                    MouseArea {
                         anchors.fill: parent
                         onDoubleClicked: {
                            EventSystem.triggerEvent(eventId)
                         }
                    }
                    Column {
                        spacing: 5
                        Text {
                            width: 190
                            color: root.textColor
                            text: eventId
                            font.family: root.font.family
                        }
                        Text {
                            width: 190
                            color: root.textColor
                            text: "[" + shortcut +"]"
                            font.family: root.font.family
                        }
                    }
                    Shortcut {
                        sequence: shortcut
                        onActivated : {
                            EventSystem.triggerEvent(eventId)
                        }
                    }
                }
        }
    }
}
