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

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33000001311302185;height:10000;width:10000}D{i:2;flowX:1439.7878796307727;flowY:59.24242327911688}
D{i:12;flowX:214.45454364834416;flowY:80.24242327911688}D{i:15;flowX:964;flowY:1395}
D{i:13;flowX:214.45454364834416;flowY:80.24242327911688}D{i:16;flowX:964;flowY:1395}
D{i:18;flowX:57.57575528790261;flowY:1212.696966927461}D{i:17;flowX:1371.3636349186752;flowY:383.39393782856496}
D{i:19;flowX:57.57575528790261;flowY:1212.696966927461}D{i:20;flowX:3182.9999630451207;flowY:1339.0000134110448}
D{i:1;flowX:494;flowY:791}
}
##^##*/

