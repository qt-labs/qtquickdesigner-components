// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowView {

    width: 478
    height: 415
    Page01 {
        id: page01
        FlowActionArea {
            target: forwardTransition
            x: 66
            y: 259
            width: 107
            height: 51
            //enabled: false


            /*
            Connections {
                target: page01.button
                onClicked: forwardTransition.trigger()
            }
            */
        }

        FlowActionArea {
            target: forwardTransition02
            x: 465
            y: 259
            width: 102
            height: 51
        }

        FlowActionArea {
            target: flowTransition3
            x: 267
            y: 259
            width: 107
            height: 51
        }
    }
    Page02 {
        id: page02
        FlowActionArea {
            width: 105
            height: 41

            //enabled: false


            /*
            Connections {
                target: page02.button
                onClicked: backwardTransition.trigger()
            }*/
            target: backwardTransition
            x: 169
            y: 361
        }
    }

    Page03 {
        id: page03

        FlowActionArea {
            target: otherTransition
            x: 222
            y: 313
            width: 137
            height: 64
        }
    }

    Page04 {
        id: page04

        FlowActionArea {
            target: flowTransition
            x: 262
            y: 348
            width: 120
            height: 42
        }

        FlowActionArea {
            target: flowTransition1
            x: 501
            y: 66
            width: 64
            height: 60
        }

        FlowActionArea {
            target: flowTransition2
            x: 31
            y: 80
            width: 144
            height: 32
        }
    }

    Page05 {
        id: page05

        FlowActionArea {
            target: flowTransition4
            x: 97
            y: 215
            width: 121
            height: 98
        }
    }

    Page06 {
        id: page06

        FlowActionArea {
            target: flowTransition6
            x: 390
            y: 322
            width: 174
            height: 131
        }

        FlowActionArea {
            target: flowTransition5
            x: 390
            y: 109
            width: 174
            height: 123
        }
    }

    Page06 {
        id: page061
        x: -277
        y: -37
    }

    flowTransitions: [
        FlowTransition {
            id: forwardTransition
            from: page01
            to: page02
        },
        FlowTransition {
            id: forwardTransition02
            from: page01
            to: page02
        },
        FlowTransition {
            id: backwardTransition
            from: page02
            to: page01
        },
        FlowTransition {
            id: otherTransition
            from: page03
            to: page01
        },
        FlowTransition {
            id: flowTransition
            to: page01
            from: page04
        },
        FlowTransition {
            id: flowTransition1
            to: page06
            from: page04
        },
        FlowTransition {
            id: flowTransition2
            to: page05
            from: page04
        },
        FlowTransition {
            id: flowTransition3
            to: page05
            from: page01
        },
        FlowTransition {
            id: flowTransition4
            to: page04
            from: page05
            effect: FlowFadeEffect {}
        },
        FlowTransition {
            id: flowTransition5
            to: page03
            from: page06
        },
        FlowTransition {
            id: flowTransition6
            to: page03
            from: page06
        }
    ]
}
