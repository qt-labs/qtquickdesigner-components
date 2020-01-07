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

import QtQuick 2.10
import TransitionItem 1.0
import QtQuick.Controls 2.3
import FlowView 1.0

Rectangle {
    id: rectangle
    x: 2
    width: Constants.width
    height: Constants.height
    color: "#0b0b0b"

    state: "Screen01"

    FlowView {
        id: transitionView
        x: 111
        y: 52
        width: 480
        height: 640
        clip: true

        defaultTransition: FlowTransition {
        }

        flowTransitions: [
            FlowTransition {
                from: page01
                to: page02
                effect: FlowSlideUpEffect {
                }
            },
            FlowTransition {
                from: page02
                to: page01
                effect: FlowSlideDownEffect {
                }
            },

            FlowTransition {
                from: page02
                to: page03
                effect: FlowPushRightEffect {
                }
            },

            FlowTransition {
                from: page03
                to: page01
                effect: FlowFadeEffect {
                }
            }
        ]

        Rectangle {
            id: page01
            width: 480
            height: 640
            color: "#646464"

            Rectangle {
                id: rectangle2
                x: 58
                y: 417
                width: 364
                height: 107
                color: "#ffffff"
                radius: 4

                TextField {
                    id: textField
                    x: 114
                    y: 57
                    width: 136
                    height: 32
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "Password"
                }

                TextField {
                    id: textField1
                    x: 114
                    y: 19
                    width: 136
                    height: 32
                    text: "email"
                    horizontalAlignment: Text.AlignHCenter
                    placeholderText: "Login"
                }
            }

            Label {
                id: label
                x: 196
                y: 257
                color: "#a0a0a0"
                text: qsTr("Login")
                font.bold: true
                font.pointSize: 24
            }

            Button {
                id: next
                x: 375
                y: 540
                text: qsTr("Next")
            }
        }

        Rectangle {
            id: page02
            width: 480
            height: 640
            color: "#646464"
            Rectangle {
                id: rectangle3
                x: 58
                y: 417
                width: 364
                height: 107
                color: "#ffffff"
                radius: 4
            }

            Label {
                id: label1
                x: 140
                y: 240
                color: "#a0a0a0"
                text: qsTr("Accept Terms")
                font.pointSize: 24
                font.bold: true
            }

            Button {
                id: back
                x: 58
                y: 545
                text: qsTr("Login")
            }

            Button {
                id: accept
                x: 188
                y: 455
                text: qsTr("Accept Terms")
            }
        }

        Rectangle {
            id: page03
            width: 480
            height: 640
            color: "#646464"
            Rectangle {
                id: rectangle4
                x: 58
                y: 417
                width: 364
                height: 107
                color: "#ffffff"
                radius: 4

                Label {
                    id: label3
                    x: 149
                    y: 44
                    text: qsTr("Thank You")
                }
            }

            Label {
                id: label2
                x: 162
                y: 244
                color: "#a0a0a0"
                text: qsTr("Thank You")
                font.pointSize: 24
                font.bold: true
            }

            Button {
                id: abort
                x: 58
                y: 545
                text: qsTr("Abort")
            }
        }
    }
    MyMenu {
        id: menu
        x: 111
        y: 52
    }

    Connections {
        target: next
        onClicked: {
            rectangle.state = "Screen02"
        }
    }

    Connections {
        target: back
        onClicked: {
            rectangle.state = "Screen01"
        }
    }

    Connections {
        target: accept
        onClicked: {
            rectangle.state = "Screen03"
        }
    }

    Connections {
        target: abort
        onClicked: {
            rectangle.state = "Screen01"
        }
    }
    states: [
        State {
            name: "Screen01"
        },
        State {
            name: "Screen02"

            PropertyChanges {
                target: transitionView
                currentIndex: 1
            }
        },
        State {
            name: "Screen03"

            PropertyChanges {
                target: transitionView
                currentIndex: 2
            }
        }
    ]
}
