// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Timeline 1.0

FlowEffect {
    id: effect

    property real scale: 1
    property real opacity: 1

    duration: 250
    onStarted: {
        group01.target = transitionView.__fromContentItem
        group02.target = transitionView.__toContentItem
        group03.target = transitionView.__fromContentItem
        group04.target = transitionView.__toContentItem
        group05.target = transitionView.__fromContentItem
        group06.target = transitionView.__toContentItem
    }

    timeline: Timeline {
        startFrame: 0
        endFrame: 1000

        KeyframeGroup {
            id: group01

            property: "x"

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1000
                value: effect.transitionView.width
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group02

            property: "x"

            Keyframe {
                frame: 0
                value: -effect.transitionView.width
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group03

            property: "scale"

            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 1000
                value: effect.scale
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group04

            property: "scale"

            Keyframe {
                frame: 0
                value: effect.scale
            }

            Keyframe {
                frame: 1000
                value: 1
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group05

            property: "opacity"

            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 1000
                value: effect.opacity
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group06

            property: "opacity"

            Keyframe {
                frame: 0
                value: effect.opacity
            }

            Keyframe {
                frame: 1000
                value: 1
                easing: effect.easing
            }
        }
    }
}
