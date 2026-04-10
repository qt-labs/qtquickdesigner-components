// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton
import QtQuick 2.10
import QtQuick.Window 2.2
import EventList 1.0

QtObject {
    id: root
    property ListModel model
    signal eventTriggered(string eventID, string parameters)

    function init(modelURI) {
        eventListLoader.loaded.connect(modelLoaded)
        eventListLoader.source = modelURI
    }

    function modelLoaded()
    {
        eventList.model = eventListLoader.item
        eventList.eventTriggered.connect(eventTriggered)
    }

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

        //eventDialog.modality = Qt.ApplicationModal
        eventDialog.show()
        eventDialog.raise()
    }

    function hide()
    {
        eventDialog.modality = Qt.NonModal
        eventDialog.hide()
        eventDialog.lower()
    }

    property Window eventDialog: Window {
        width: 250
        height: 250
        modality: Qt.NonModal

        EventList {
            id: eventList
        }

        Loader {
            id: eventListLoader
        }
    }
}
