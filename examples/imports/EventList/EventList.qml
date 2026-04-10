// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Window 2.2

ListView {
    signal eventTriggered(string eventId, string parameters)
    anchors.fill: parent
    highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
    delegate:
        Rectangle {
        id: wrapper
        width: parent.width
        height: 40

        MouseArea {
            anchors.fill: parent
            onDoubleClicked: {
                if (parameters != undefined)
                    eventTriggered(eventId, parameters)
                else
                    eventTriggered(eventId, undefined)
            }
        }
        Row {
            spacing: 32
            Text {
                width: 400
                text: eventId
                color: "grey"
            }
            Text {
                width: 200
                text: shortcut
                horizontalAlignment: Text.AlignRight
            }
        }
        color: "lightgrey"
        Shortcut {
            sequence: shortcut
            onActivated : {
                if (parameters != undefined)
                    eventTriggered(eventId, parameters)
                else
                    eventTriggered(eventId, undefined)
            }
        }
    }
}
