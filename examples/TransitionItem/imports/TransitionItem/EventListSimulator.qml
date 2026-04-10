// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import QtQuick.Studio.EventSystem 1.0
import QtQuick.Studio.EventSimulator 1.0

QtObject {
    id: simulator
    property bool active: true

    property Timer timer: Timer {
        interval: 100
        onTriggered: {
            EventSimulator.show()
        }
    }

    Component.onCompleted: {
        EventSystem.init(Qt.resolvedUrl("EventListModel.qml"))
        if (simulator.active)
            timer.start()
    }
}
