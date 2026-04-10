// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Studio.EventSystem 1.0

Rectangle {
    id: delegateItem
    width: 190
    height: 60
    color: simulatorWindow.cellColor
    border {
        color: simulatorWindow.borderColor
        width: 1
    }

    MouseArea {
        anchors.fill: parent
        onDoubleClicked: {
            EventSystem.triggerEvent(eventId)
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 5
        Text {
            width: 190
            color: root.textColor
            text: eventId
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: root.font.family
        }

        Text {
            width: 190
            color: root.textColor
            text: "[" + shortcut +"]"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: root.font.family
        }
    }

    Shortcut {
        sequence: shortcut
        enabled: list.focus
        onActivated : {
            EventSystem.triggerEvent(eventId)
        }
    }
}
