// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton
import QtQuick 2.10
import QtQuick.Window 2.2

Item {
    signal eventTriggered(string eventID, string parameters)
    property ListModel model

    function __modelLoaded()
    {
        model = eventListLoader.item
    }

    function init(modelURI) {
        eventListLoader.loaded.connect(__modelLoaded)
        eventListLoader.source = modelURI
    }

    function triggerEvent(eventId) {
        for (var i = 0; i < model.count; i++) {
            if (model.get(i).eventId === eventId) {
                eventTriggered(eventId, model.get(i).parameters)
            }
        }
    }

    Loader {
        id: eventListLoader
    }
}
