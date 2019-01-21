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
import QtQuick.Timeline 1.0

Item {
    id: menu
    width: 480
    height: 249

    state: "Closed"

    Rectangle {
        id: content
        color: "#727272"
        opacity: 0
        anchors.top: parent.top
        anchors.topMargin: 50
        clip: true
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        Slider {
            x: 258
            y: 146
            value: 0.5
        }

        Switch {
            x: 22
            y: 30
            text: qsTr("WLAN")
            checked: true
        }

        Label {
            x: 173
            y: 154
            text: qsTr("Brightness")
        }

        Slider {
            x: 258
            y: 92
            value: 0.5
        }

        Label {
            x: 173
            y: 100
            text: qsTr("Volume")
        }

        SpinBox {
            x: 264
            y: 48
            value: 18
        }

        SpinBox {
            x: 364
            y: 48
            value: 45
        }

        Label {
            x: 173
            y: 53
            text: qsTr("Time")
        }
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 480
        height: 59
        color: "#ffffff"

        Column {
            id: column
            x: 442
            y: 21
            rotation: 90
            spacing: 6

            Rectangle {
                width: 20
                height: 2
                color: "#292929"
            }

            Rectangle {
                width: 20
                height: 2
                color: "#292929"
            }

            Rectangle {
                width: 20
                height: 2
                color: "#292929"
            }
        }

        Rectangle {
            id: shadow
            y: 58
            height: 1
            color: "#565656"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: -1
            anchors.right: parent.right
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: opening
                onFinished: menu.state = "Open"
                from: 0
                running: false
                duration: 350
                to: 1000
                loops: 1
            },
            TimelineAnimation {
                id: closing
                onFinished: menu.state = "Closed"
                from: 1000
                running: false
                duration: 200
                to: 0
                loops: 1
            }
        ]
        enabled: true
        endFrame: 1000
        startFrame: 0

        KeyframeGroup {
            target: content
            property: "opacity"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.25, 0.46, 0.45, 0.94, 1, 1]
                value: 1
                frame: 1000
            }

            Keyframe {
                value: 0
                frame: 240
            }
        }

        KeyframeGroup {
            target: content
            property: "anchors.bottomMargin"
            Keyframe {
                value: 190
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.25, 0.46, 0.45, 0.94, 1, 1]
                value: 0
                frame: 1000
            }
        }

        KeyframeGroup {
            target: content
            property: "height"
            Keyframe {
                value: 10
                frame: 0
            }
        }

        KeyframeGroup {
            target: column
            property: "rotation"
            Keyframe {
                value: 0
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.77, 0, 0.175, 1, 1, 1]
                value: 90
                frame: 1000
            }

            Keyframe {
                value: 0
                frame: 400
            }
        }
    }

    MouseArea {
        id: open
        x: 420
        y: 0
        width: 60
        height: 59
        visible: false
    }

    MouseArea {
        id: close
        x: 420
        y: 0
        width: 60
        height: 59
        visible: false
    }

    Connections {
        target: open
        onClicked: {
            menu.state = "Opening"
        }
    }

    Connections {
        target: close
        onClicked: {
            menu.state = "Closing"
        }
    }
    states: [
        State {
            name: "Closed"

            PropertyChanges {
                target: timeline
                currentFrame: 0
                enabled: true
            }

            PropertyChanges {
                target: open
                visible: true
            }
        },
        State {
            name: "Opening"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: opening
                running: true
            }
        },
        State {
            name: "Closing"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: closing
                running: true
            }
        },
        State {
            name: "Open"

            PropertyChanges {
                target: timeline
                currentFrame: 1000
                enabled: true
            }

            PropertyChanges {
                target: close
                visible: true
            }
        }
    ]
}

/*##^## Designer {
    D{i:0;height:249;width:480}D{i:7;anchors_height:200;anchors_width:200;anchors_x:-1;anchors_y:58;timeline_expanded:true}
}
 ##^##*/
