// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import QtQuick.Timeline 1.0

FlowEffect {
    id: effect

    property real itemHeight: transitionView.height
    property int direction: 0
    //left, right, up, down

    duration: 250
    onStarted: {
        group01.target = effect.transitionView.__toContentItem
        group02.target = effect.transitionView.__toContentItem
    }

    timeline: Timeline {
        startFrame: 0
        endFrame: 1000

        KeyframeGroup {
            id: group01

            property: "x"

            Keyframe {
                frame: 0

                value: {
                    if (effect.direction === 0)
                        return -effect.transitionView.width
                    if (effect.direction === 1)
                        return effect.transitionView.width
                    return 0
                }
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }


        KeyframeGroup {
            id: group02

            property: "y"

            Keyframe {
                frame: 0

                value: {
                    if (effect.direction === 2)
                        return -effect.itemHeight
                    if (effect.direction === 3)
                        return effect.itemHeight
                    return 0
                }
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }



    }
}
