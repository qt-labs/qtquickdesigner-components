
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

Rectangle {
    width: 1080
    height: 1920
    color: "#060606"

    SimpleIndicator {
        x: 440
        y: 1776
        list: pageList
    }

    FlowTransitionList {
        id: pageList
        intialItem: screen01
        items: [screen01, screen02, screen03]
    }

    FlowTransitionList {
        id: pageList2
        intialItem: appView
        items: [appView, settings]
    }

    FlowView {
        id: mainView

        anchors.fill: parent

        activatedItem: pageList2.currentItem

        interaction: SwipeInteraction {
            transitionView: mainView
            list: pageList2
            horizontal: false
        }

        flowTransitions: [
            FlowTransition {
                from: appView
                to: settings

                effect: FlowSlideDownEffect {
                    itemHeight: settings.height
                    outOpacity: 0
                }
            },

            FlowTransition {
                from: settings
                to: appView

                effect: FlowPushUpEffect {
                    fromItemHeight: settings.height
                    revealCurrent: true
                    inOpacity: 0.2
                }
            }
        ]

        FlowView {
            id: appView

            objectName: "appView"

            x: 32
            y: 42
            width: mainView.width - 64
            height: mainView.height - 84

            activatedItem: pageList.currentItem

            interaction: SwipeInteraction {
                transitionView: appView
                list: pageList
                horizontal: true
            }

            flowTransitions: [
                FlowTransition {
                    from: screen01
                    to: screen02

                    effect: FlowPushRightEffect {
                        scale: 0.6
                        opacity: 0
                    }
                },

                FlowTransition {
                    from: screen02
                    to: screen03

                    effect: FlowPushRightEffect {
                        scale: 0.6
                        opacity: 0
                    }
                },
                FlowTransition {
                    from: screen03
                    to: screen02

                    effect: FlowPushLeftEffect {
                        scale: 0.6
                        opacity: 0
                    }
                },
                FlowTransition {
                    from: screen02
                    to: screen01

                    effect: FlowPushLeftEffect {
                        scale: 0.6
                        opacity: 0
                    }
                }
            ]

            Grid {
                id: screen01
                width: appView.width
                height: appView.height
                columns: 4
                spacing: 76

                Icon {
                    text: "Eye"
                    identifer: "f06e"
                }

                Icon {
                    text: "Notify"
                    identifer: "f024"
                }

                Icon {
                    text: "Alarm"
                    identifer: "f0f3"
                }

                Icon {
                    text: "Wizard"

                    identifer: "f1d8"
                }

                Icon {
                    text: "Foder"

                    identifer: "f187"
                }

                Icon {
                    text: "Night"

                    identifer: "f186"
                }

                Icon {
                    text: "Picker"

                    identifer: "f1fb"
                }

                Icon {
                    text: "Writer"

                    identifer: "f0e0"
                }

                Icon {
                    text: "Keyboard"

                    identifer: "f11c"
                }

                Icon {
                    text: "Home"

                    identifer: "f015"
                }

                Icon {
                    text: "Update"
                    identifer: "f06e"
                }

                Icon {
                    text: "Flag"
                    identifer: "f024"
                }

                Icon {
                    text: "Notification"
                    identifer: "f0f3"
                }

                Icon {
                    identifer: "f1d8"
                }

                Icon {
                    identifer: "f187"
                }

                Icon {
                    text: "Battery"
                    identifer: "f06d"
                }

                Icon {
                    text: "Color"
                    identifer: "f1fb"
                }

                Icon {
                    text: "Bus"
                    identifer: "f207"
                }

                Icon {
                    text: "Image"
                    identifer: "f03e"
                }

                Icon {
                    text: "World"
                    identifer: "f0ac"
                }

                Icon {
                    text: "Message"
                    identifer: "f06c"
                }

                Icon {
                    identifer: "f0e0"
                }

                Icon {
                    text: "Settings"
                    identifer: "f11c"
                }

                Icon {
                    text: "Bugs"
                    identifer: "f188"
                }
            }

            Grid {
                id: screen02
                width: appView.width
                height: appView.height
                Icon {
                    identifer: "f06e"
                }

                Icon {
                    identifer: "f0b1"
                }

                Icon {
                    identifer: "f207"
                }

                Icon {
                    identifer: "f14e"
                }

                Icon {
                    identifer: "f187"
                }

                Icon {
                    identifer: "f084"
                }

                Icon {
                    identifer: "f085"
                }

                Icon {
                    identifer: "f0e0"
                }

                Icon {
                    text: "Preview"
                    identifer: "f1d8"
                }

                Icon {
                    identifer: "f015"
                }

                Icon {
                    identifer: "f06e"
                }

                Icon {
                    identifer: "f024"
                }

                Icon {
                    identifer: "f06b"
                }

                Icon {
                    text: "Woman"
                    identifer: "f182"
                }

                Icon {
                    text: "Memory"
                    identifer: "f0a0"
                }

                Icon {
                    identifer: "f186"
                }

                Icon {
                    identifer: "f1fb"
                }

                Icon {
                    text: "Transport"
                    identifer: "f207"
                }

                Icon {
                    text: "Lightness"
                    identifer: "f0eb"
                }

                Icon {
                    identifer: "f193"
                }

                Icon {
                    identifer: "f06c"
                }

                Icon {
                    identifer: "f0e0"
                }

                Icon {
                    identifer: "f275"
                }

                Icon {
                    identifer: "f188"
                }
                spacing: 76
                columns: 4
            }

            Grid {
                id: screen03
                width: appView.width
                height: appView.height
                Icon {
                    identifer: "f06e"
                }

                Icon {
                    identifer: "f024"
                }

                Icon {
                    identifer: "f0f3"
                }

                Icon {
                    identifer: "f1d8"
                }

                Icon {
                    identifer: "f187"
                }

                Icon {
                    identifer: "f186"
                }

                Icon {
                    text: "Bluetooth"
                    identifer: "f293"
                }

                Icon {
                    identifer: "f0e0"
                }

                Icon {
                    text: "Mail"
                    identifer: "f2b6"
                }

                Icon {
                    text: "Male"
                    identifer: "f183"
                }

                Icon {
                    text: "Games"
                    identifer: "f11b"
                }

                Icon {
                    text: "Comment"
                    identifer: "f075"
                }

                Icon {
                    identifer: "f0f3"
                }

                Icon {
                    identifer: "f1d8"
                }

                Icon {
                    identifer: "f187"
                }

                Icon {
                    text: "Address Book"
                    identifer: "f2b9"
                }

                Icon {
                    identifer: "f1fb"
                }

                Icon {
                    identifer: "f207"
                }

                Icon {
                    text: "Pause"
                    identifer: "f254"
                }

                Icon {
                    identifer: "f0ac"
                }

                Icon {
                    text: "Rate"
                    identifer: "f005"
                }

                Icon {
                    identifer: "f0e0"
                }

                Icon {
                    text: "Chip"
                    identifer: "f2db"
                }

                Icon {
                    identifer: "f118"
                }
                spacing: 76
                columns: 4
            }
        }

        Rectangle {
            id: settings
            Rectangle {
                color: "#ffffff"
                width: mainView.width
                height: 20
            }

            color: "#ffffff"
            width: mainView.width
            height: mainView.height * 0.5
            objectName: "settings"
            radius: 16
        }
    }
}
