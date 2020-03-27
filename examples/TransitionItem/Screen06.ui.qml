import QtQuick 2.12


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
import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowView {

    width: 478
    height: 415
    flowTransitions: [
        FlowTransition {
            id: flowTransition
            effect: FlowSlideUpEffect {}
            from: page01
            to: page04
        },
        FlowTransition {
            id: flowTransition1
            effect: FlowSlideUpEffect {}
            from: page01
            to: page06
        },
        FlowTransition {
            id: flowTransition2
            effect: FlowPushRightEffect {
                opacity: 0.8
                scale: 0.8
            }
            from: page01
            to: page02
        },
        FlowTransition {
            id: flowTransition3
            effect: FlowSlideDownEffect {}
            from: page04
            to: page01
        },
        FlowTransition {
            id: flowTransition4
            effect: FlowSlideDownEffect {}
            from: page06
            to: page01
        },
        FlowTransition {
            id: flowTransition5
            effect: FlowPushRightEffect {
                opacity: 0.8
                scale: 0.8
            }
            from: page02
            to: page05
        },
        FlowTransition {
            id: flowTransition6
            effect: FlowPushLeftEffect {
                opacity: 0.8
                scale: 0.8
            }
            from: page05
            to: page01
        },
        FlowTransition {
            id: flowTransition7
            effect: FlowSlideUpEffect {}
            from: page01
            to: page03
        },
        FlowTransition {
            id: flowTransition8
            from: page03
            to: page01
        },
        FlowTransition {
            id: flowTransition9
            from: page03
            to: page01
        }
    ]
    Page01 {
        id: page01

        FlowActionArea {
            target: flowTransition
            x: 65
            y: 257
            width: 110
            height: 57
        }

        FlowActionArea {
            target: flowTransition2
            x: 462
            y: 257
            width: 110
            height: 57
        }

        FlowActionArea {
            target: flowTransition1
            x: 265
            y: 257
            width: 110
            height: 57
        }

        FlowActionArea {
            target: flowTransition7
            x: 54
            y: 112
            width: 126
            height: 74
        }
    }
    Page02 {
        id: page02

        FlowActionArea {
            target: flowTransition5
            x: 171
            y: 365
            width: 95
            height: 33
        }
    }

    Page03 {
        id: page03

        FlowActionArea {
            target: flowTransition8
            x: 0
            y: 8
            width: 88
            height: 20
        }

        FlowActionArea {
            target: flowTransition9
            x: 258
            y: 271
            width: 113
            height: 69
        }
    }

    Page04 {
        id: page04

        FlowActionArea {
            target: flowTransition3
            x: 250
            y: 344
            width: 140
            height: 50
        }
    }

    Page05 {
        id: page05

        FlowActionArea {
            target: flowTransition6
            x: 103
            y: 200
            width: 113
            height: 111
        }
    }

    Page06 {
        id: page06

        FlowActionArea {
            target: flowTransition4
            x: 381
            y: 100
            width: 187
            height: 139
        }
    }
}

/*##^##
Designer {
    D{i:0;height:10000;width:10000}D{i:19;flowX:836;flowY:619}D{i:24;flowX:1710;flowY:595}
D{i:26;flowX:968;flowY:41}D{i:29;flowX:28;flowY:914}D{i:31;flowX:1697;flowY:1348}
D{i:9;color:"#c2c2c2";inOffset:"-24";outOffset:"-64"}D{i:17;inOffset:23}D{i:18;inOffset:"-26"}
}
##^##*/

