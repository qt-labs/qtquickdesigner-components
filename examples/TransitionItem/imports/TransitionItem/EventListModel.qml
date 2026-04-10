// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0

ListModel {
    id: eventListModel
    ListElement {
        eventId: "jogLeft"
        eventDescription: "emitted when moving the jog to the left"
        shortcut: "Left"
    }
    ListElement {
        eventId: "jogRight"
        eventDescription: "emitted when moving the jog to the right"
        shortcut: "Right"
    }
    ListElement {
        eventId: "buttonPress"
        eventDescription: "Emitted when pressing the button"
        shortcut: "Return"
        parameters: "Enter"
    }
    ListElement {
        eventId: "escapeButton"
        eventDescription: "Closes the application"
        shortcut: "Escape"
    }
}
