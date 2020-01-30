/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

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

/*##^##
Designer {
    D{i:0;height:6400;width:4800}D{i:3;flowX:752;flowY:"-256"}D{i:1;flowX:836;flowY:619}
D{i:6;flowX:"-617";flowY:325}D{i:5;flowX:1738;flowY:560}D{i:7;flowX:1081;flowY:39}
D{i:10;flowX:829;flowY:1324}D{i:9;flowX:28;flowY:914}D{i:13;flowX:1697;flowY:1348}
}
##^##*/

