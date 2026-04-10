// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root
    signal triggered(var eventId, var parameters)
    property string eventIds
    property var __eventIdList
    function __receiveEvent(eventId, parameters) {
        if (root.eventIds === eventId || __eventIdList.indexOf(eventId) > -1)
            root.triggered(eventId, parameters)
    }

    onEventIdsChanged:{
        var split = root.eventIds.split(',').map(item=>item.trim());
        if (split.length > 0) {
            __eventIdList = split
        }
    }

    Component.onCompleted: {
        EventSystem.eventTriggered.connect(__receiveEvent)
    }
}
