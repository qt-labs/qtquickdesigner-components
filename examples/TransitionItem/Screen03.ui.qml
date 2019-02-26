

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
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0
import TransitionView 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    TransitionList {
        id: pageList
        intialItem: page01
        items: [page01, page02, page03, page04, page05]
    }
    TransitionView {

        interaction: SwipeInteraction {
            transitionView: view
            list: pageList
        }
        id: view
        x: 3
        y: -4
        width: 1277
        height: 727

        activatedItem: pageList.currentItem

        Image {
            id: page01
            source: "images/shuttle1.jpg"
            objectName: "page01"

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("1")
                font.pixelSize: 24
            }
        }

        Image {
            id: page02
            source: "images/shuttle2.jpg"
            objectName: "page02"

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("2")
                font.pixelSize: 24
            }
        }

        Image {
            id: page03
            source: "images/shuttle3.jpg"
            objectName: "page03"

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("3")
                font.pixelSize: 24
            }
        }

        Image {
            id: page04
            source: "images/shuttle4.jpg"
            objectName: "page04"

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("4")
                font.pixelSize: 24
            }
        }

        Image {
            id: page05
            source: "images/shuttle5.jpg"
            objectName: "page05"

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("5")
                font.pixelSize: 24
            }
        }

        Image {
            id: page06
            source: "images/shuttle6.jpg"

            Button {
                id: button
                text: qsTr("Back")
            }

            Text {
                x: 1225
                y: 17
                color: "#ffffff"
                text: qsTr("6")
                font.pixelSize: 24
            }
        }

        defaultTransition: PageTransition {
        }

        transitions: [
            PageTransition {
                from: page01
                to: page02

                effect: PageSlideRightEffect {
                }
            },

            PageTransition {
                from: page02
                to: page03

                effect: PageSlideRightEffect {
                    duration: 500
                }
            },
            PageTransition {
                from: page03
                to: page04

                effect: PagePushRightEffect {
                }
            },
            PageTransition {
                from: page04
                to: page05

                effect: PagePushRightEffect {
                    duration: 500
                }
            },

            PageTransition {
                from: page05
                to: page06

                effect: PageSlideUpEffect {
                    easing.bezierCurve: [0.236, 0.75, 0.592, 0.862, 0.768, 0.982, 0.861, 0.936, 0.812, 0.929, 0.886, 0.96, 0.93, 0.984, 0.957, 0.986, 1, 1]
                }
            },

            PageTransition {
                from: page06
                to: page05

                effect: PageSlideDownEffect {
                    easing.bezierCurve: [0.236, 0.75, 0.592, 0.862, 0.768, 0.982, 0.861, 0.936, 0.812, 0.929, 0.886, 0.96, 0.93, 0.984, 0.957, 0.986, 1, 1]
                }
            },
            PageTransition {
                from: page04
                to: page03

                effect: PagePushLeftEffect {
                }
            },
            PageTransition {
                from: page05
                to: page04

                effect: PagePushLeftEffect {
                    duration: 500
                }
            },

            PageTransition {
                from: page02
                to: page01

                effect: PageSlideLeftEffect {
                }
            },

            PageTransition {
                from: page03
                to: page02

                effect: PageSlideLeftEffect {
                    duration: 500
                }
            },

            PageTransition {
                id: transitionToStart
                from: page06
                to: page01
                effect: PageFadeEffect {
                }
            }
        ]
    }

    SimpleTabBar {
        list: pageList
    }

    Connections {
        target: button
        onClicked: {
            transitionToStart.trigger()
        }
    }

    Label {
        id: label
        x: 331
        y: 24
        color: "#ffffff"
        text: view.currentIndex
        font.pointSize: 24
    }

    Label {
        id: label1
        x: 599
        y: 24
        color: "#ffffff"
        text: Math.round(view.progress)
        font.pointSize: 24
    }

    Connections {
        target: next
        onClicked: pageList.next()
    }

    Connections {
        target: prev
        onClicked: pageList.prev()
    }

    Connections {
        target: back
        onClicked: pageList.currentItem = view.lastItem
    }

    Button {
        id: prev
        x: 8
        y: 631
        text: qsTr("Prev ") + (pageList.prevItem ? pageList.prevItem.objectName : "")
        enabled: pageList.prevItem !== null
    }

    Button {
        id: next
        x: 939
        y: 631
        text: qsTr("Next ") + (pageList.nextItem ? pageList.nextItem.objectName : "")
        enabled: pageList.nextItem !== null
    }

    Button {
        id: back
        x: 11
        y: 80
        text: qsTr("Back ") + (view.lastItem ? view.lastItem.objectName : "")
        enabled: view.lastItem !== null
    }
}
