// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowView {
    id: flowView
    width: 478
    height: 415

    flowDecisions: [
        DecisionDialog {
            id: dialog
            text: "This is a question?"
            targets: [flowTransition1, flowTransition2, flowTransition3]
        }
    ]

    flowWildcards: [
        FlowWildcard {
            id: wildcard01
            target: wildcardTransition
        }
    ]

    defaultTransition: FlowTransition {}

    flowTransitions: [
        FlowTransition {
            id: flowTransition1
            effect: FlowSlideUpEffect {}
            to: page05
            from: page01
        },
        FlowTransition {
            id: flowTransition2
            effect: FlowSlideRightEffect {}
            to: page04
            from: page01
        },
        FlowTransition {
            id: flowTransition3
            effect: FlowSlideRightEffect {}
            to: page06
            from: page01
        },

        FlowTransition {
            id: flowTransition4
            to: dialog
            from: page01
        },
        FlowTransition {
            id: start
            to: page01
            from: flowView
        },
        FlowTransition {
            id: wildcardTransition
            to: page01
            //from: null
        }
    ]

    Page01 {
        id: page01

        FlowActionArea {
            id: flowAction
            target: flowTransition4
            x: 264
            y: 248
            width: 112
            height: 76

            Connections {
                target: flowTransition2
                onClicked: flowAction.trigger()
            }
        }
    }

    Page05 {
        id: page05
    }

    Page04 {
        id: page04

        FlowActionArea {
            x: 8
            y: 8
            width: 80
            height: 63
            goBack: true
        }
    }

    Page06 {
        id: page06
    }

    Page06 {
        id: page061
    }
}
