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

Item {
    width: Constants.width
    height: Constants.height

    FlowView {
        x: 401
        y: 153
        width: 478
        height: 415
        FlowItem {
            FlowActionArea {
                enabled: false

                Connections {
                    target: button
                    onClicked: forwardTransition.trigger()
                }
            }

            id: page01
            width: 333
            height: 319

            Rectangle {
                color: "#ffffff"
                anchors.fill: parent

                Button {
                    id: button
                    x: 27
                    y: 254
                    text: qsTr("Next")
                }
            }

            Text {
                id: element
                text: qsTr("Page 01")
                font.pixelSize: 12
            }
        }
        FlowItem {
            id: page02
            width: 333
            height: 319

            Rectangle {
                color: "#ffffff"
                anchors.fill: parent

                Button {
                    id: button1
                    x: 15
                    y: 263
                    text: qsTr("Back")
                }
            }

            Text {
                text: qsTr("Page 02")
                font.pixelSize: 12
            }

            FlowActionArea {
                enabled: false

                Connections {
                    target: button1
                    onClicked: backwardTransition.trigger()
                }
            }
        }
        flowTransitions: [
            FlowTransition {
                id: forwardTransition
                from: page01
                to: page02
            },
            FlowTransition {
                id: backwardTransition
                from: page02
                to: page01
            }
        ]
    }
}
