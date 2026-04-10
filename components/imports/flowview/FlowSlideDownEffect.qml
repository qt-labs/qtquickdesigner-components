// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Timeline 1.0

FlowEffect {
    id: effect

    property real itemHeight: transitionView.height
    property real outOpacity: 1

    duration: 250
    onStarted: {
        group01.target = transitionView.__toContentItem
        group02.target = transitionView.__fromContentItem
        group01.target.z = 1
    }

    timeline: Timeline {
        startFrame: 0
        endFrame: 1000

        KeyframeGroup {
            id: group01

            property: "y"

            Keyframe {
                frame: 0
                value: -effect.itemHeight
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group02

            property: "opacity"

            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 1000
                value: effect.outOpacity
                easing: effect.easing
            }
        }
    }
}
