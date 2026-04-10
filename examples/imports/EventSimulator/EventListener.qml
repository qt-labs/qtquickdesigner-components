// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import EventList 1.0

QtObject {
    id: root
    signal triggered(var parameters)
    property string eventIds

    function __receiveEvent(eventId, parameters) {
        var split = root.eventIds.split(',').map(item=>item.trim());
        if (root.eventIds === eventId || split.indexOf(eventId) > -1)
            root.triggered(parameters)
    }

    Component.onCompleted: {
        EventSimulator.eventTriggered.connect(__receiveEvent)
    }
}
