// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowView {
    width: 478
    height: 415
    id: flow
    children: [
        Rectangle {
            z: 10
            color: "red"
            width: 478
            height: 20
            MouseArea {
                anchors.fill: parent
                onClicked: flow.goBack()
            }
        }
    ]

    flowDecisions: [
        DecisionDialog {
            id: dialog
            text: "This is a question?"
            targets: [flowTransition6, flowTransition8]
        }
    ]

    flowTransitions: [
        FlowTransition {
            id: flowTransition
            effect: FlowSlideUpEffect {}
            to: page02
            from: page01
        },
        FlowTransition {
            id: flowTransition1
            effect: FlowSlideRightEffect {}
            to: page04
            from: page01
        },
        FlowTransition {
            id: flowTransition2
            effect: FlowSlideDownEffect {}
            to: page01
            from: page02
        },
        FlowTransition {
            id: flowTransition3
            effect: FlowSlideLeftEffect {}
            to: page01
            from: page04
        },
        FlowTransition {
            id: flowTransition4
            from: page01
            to: page05
        },
        FlowTransition {
            id: flowTransition5
            from: page05
            to: page02
        },
        FlowTransition {
            id: flowTransition6
            to: page06
            from: page02
        },
        FlowTransition {
            id: flowTransition7
            to: page02
            from: page06
        }
    ]

    Page01 {
        id: page01

        FlowActionArea {
            target: flowTransition1
            x: 456
            y: 248
            width: 116
            height: 70
        }

        FlowActionArea {
            target: flowTransition
            x: 264
            y: 248
            width: 112
            height: 76
        }

        FlowActionArea {
            target: flowTransition4
            x: 58
            y: 255
            width: 122
            height: 63
        }
    }

    Page02 {
        id: page02

        FlowActionArea {
            id: area
            target: flowTransition2
            x: 168
            y: 360
            width: 108
            height: 40

            Connections {
                target: parent
                onClicked: area.trigger()
            }
        }

        FlowActionArea {
            target: dialog
            x: 168
            y: 154
            width: 176
            height: 20
        }
    }

    Page04 {
        id: page04

        FlowActionArea {
            target: flowTransition3
            x: 244
            y: 342
            width: 152
            height: 56
        }
    }

    Page06 {
        id: page06

        FlowActionArea {
            target: flowTransition7
            x: 394
            y: 325
            width: 159
            height: 123
        }
    }

    Page05 {
        id: page05

        FlowActionArea {
            target: flowTransition5
            x: 389
            y: 202
            width: 144
            height: 115
        }
    }
}



