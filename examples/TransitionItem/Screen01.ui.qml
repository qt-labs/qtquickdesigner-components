// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10
import TransitionItem 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0
import FlowView 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    FlowView {
        id: view
        x: 3
        y: -4
        width: 1277
        height: 727
        currentIndex: slider.value
        Image {
            id: page01
            source: "images/shuttle1.jpg"
        }

        Image {
            id: page02
            source: "images/shuttle2.jpg"
        }

        Image {
            id: page03
            source: "images/shuttle3.jpg"
        }

        Image {
            id: page04
            source: "images/shuttle4.jpg"
        }

        Image {
            id: page05
            source: "images/shuttle5.jpg"
        }

        Image {
            id: page06
            source: "images/shuttle6.jpg"

            Button {
                id: button
                text: qsTr("Back")
            }
        }

        defaultTransition: FlowTransition {}

        flowTransitions: [
            FlowTransition {
                from: page01
                to: page02

                effect: FlowSlideRightEffect {}
            },

            FlowTransition {
                from: page02
                to: page03

                effect: FlowSlideRightEffect {
                    duration: 500
                }
            },
            FlowTransition {
                from: page03
                to: page04

                effect: FlowPushRightEffect {}
            },
            FlowTransition {
                from: page04
                to: page05

                effect: FlowPushRightEffect {
                    duration: 500
                }
            },

            FlowTransition {
                from: page05
                to: page06

                effect: FlowSlideUpEffect {
                    easing.bezierCurve: [0.236, 0.75, 0.592, 0.862, 0.768, 0.982, 0.861, 0.936, 0.812, 0.929, 0.886, 0.96, 0.93, 0.984, 0.957, 0.986, 1, 1]
                }
            },

            FlowTransition {
                from: page06
                to: page05

                effect: FlowSlideDownEffect {
                    easing.bezierCurve: [0.236, 0.75, 0.592, 0.862, 0.768, 0.982, 0.861, 0.936, 0.812, 0.929, 0.886, 0.96, 0.93, 0.984, 0.957, 0.986, 1, 1]
                }
            },
            FlowTransition {
                from: page04
                to: page03

                effect: FlowPushLeftEffect {}
            },
            FlowTransition {
                from: page05
                to: page04

                effect: FlowPushLeftEffect {
                    duration: 500
                }
            },

            FlowTransition {
                from: page02
                to: page01

                effect: FlowSlideLeftEffect {}
            },

            FlowTransition {
                from: page03
                to: page02

                effect: FlowSlideLeftEffect {
                    duration: 500
                }
            },

            FlowTransition {
                id: transitionToStart
                from: page06
                to: page01
                effect: FlowFadeEffect {}
            }
        ]
    }

    Slider {
        id: slider
        x: 30
        y: 23
        to: 5
        stepSize: 1
        value: 0
    }


    /*
    Connections {
        target: button
        onClicked: {
            transitionToStart.trigger()
            slider.value = 0


            view.currentIndex = Qt.binding(function () {
                return slider.value
            })
        }
    }*/
    Label {
        id: label
        x: 331
        y: 24
        color: "#ffffff"
        text: view.currentIndex
        font.pointSize: 24
    }
}
