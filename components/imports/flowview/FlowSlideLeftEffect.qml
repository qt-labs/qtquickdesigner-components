// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Timeline 1.0

FlowEffect {
    id: effect

    duration: 250
    onStarted: group01.target = transitionView.__toContentItem

    timeline: Timeline {
        startFrame: 0
        endFrame: 1000

        KeyframeGroup {
            id: group01

            property: "x"

            Keyframe {
                frame: 0
                value: -transitionView.width
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }
    }
}
