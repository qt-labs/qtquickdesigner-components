/****************************************************************************
**
** Copyright (C) 2022 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Android Automotive compatibility.
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

import QtQuick
import QtQuick.Controls

Item {
    id: root

    width: 480
    height: 640

    property alias radius: rect.radius
    property string packageName: "some.package.name"
    property string className
    readonly property alias status: internal.status
    property alias placeholder: placeholderItem.children
    property bool usePlaceholder: false

    onUsePlaceholderChanged: {
        if (placeholder) {
            placeholder.visible = usePlaceholder
            avMock.visible = !usePlaceholder
        } else {
            avMock.visible = true
        }
    }

    onPlaceholderChanged: {
        if (!placeholder)
            avMock.visible = true
    }

    enum Status {
        NotInitialized,
        Ready,
        Starting,
        Started
    }

    QtObject {
        id: internal

        property var status: ActivityView.NotInitialized
        property real fontPointSize: 20

        function enumToString(val) {
            switch (val) {
                case ActivityView.NotInitialized: return "NotInitialized"
                case ActivityView.Ready: return "Ready"
                case ActivityView.Starting: return "Starting"
                case ActivityView.Started: return "Started"
            }
            return "Unknown"
        }
    }

    component StatusButton: Rectangle {
        id: button

        color: highlighted ? "lightGray" : "gray"
        radius: 5
        clip: true
        width: btnText.width
        height: btnText.height

        property int statusId: 0
        property bool highlighted: false
        signal clicked(int value)

        Label {
            id: btnText

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: internal.fontPointSize

            text: " " + internal.enumToString(statusId) + " "
        }

        MouseArea {
            anchors.fill: parent
            onClicked: button.clicked(statusId)
        }
    }

    Item {
        id: placeholderItem
        anchors.fill: parent
    }

    Item {
        id: avMock

        anchors.fill: parent

        Rectangle {
            id: rect

            anchors.fill: parent
            color: "#AAAAAA"
            radius: 0
            border.color: "#888888"
            border.width: 2
            clip: true

            Image {
                id: icon

                anchors.centerIn: parent
                anchors.verticalCenterOffset: - statusArea.height / 2

                source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACAAQMAAAD58POIAAAABlBMV
                        EUAAAA+Pj4LNneDAAAAAXRSTlMAQObYZgAAAAlwSFlzAAALEwAACxMBAJqcGAAAASNJREFUSMft1
                        TFuwzAMBVApAqIlgNZu6hF6A/UovYm99VjV1mu46AUyelDNilJgftkx0gbtZg4C/BCFNETRSnE88
                        3JQEi+8HAEel/DEywngYV624DTv24KjMrHmvsRBEfUIxhGdI4B+I/rqESgHgmHALZbhDOAZRoDAM
                        AF0DARQniGNrhDbrERDmxXBpZwmBSnEj7mQ0Y9LSFLXBkipXf3TaVE51E5b0Lev8hOI7cveBcP9s
                        Aw4U1c2JNkSYjkDO0PHv3b0OkPpAC/wcYF3gXQNgsDnDjv8AdxuuqZP07VOdtDrZdrZCZqfr5BOA
                        j7ikJIr9i9w+2avJsxqBq3nWKjPE871wTZzfYffQ2zBUTTNx3MFlnrdjGiTz6j5AOvcsF09yG/q3
                        /z/4fD/YgAAAABJRU5ErkJggg=="
                }

            Label {
                id: packageLabel

                anchors.top: icon.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 5
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: internal.fontPointSize
                text: root.packageName
            }
        }

        Rectangle {
            id: statusArea

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: statusFlow.top
            anchors.bottom: statusFlow.bottom
            anchors.topMargin: -5
            anchors.bottomMargin: -5
            color: "black"
            opacity: 0.5
            radius: rect.radius
        }

        Label {
            id: statusLabel

            anchors.top: statusFlow.top
            anchors.left: parent.left

            text: " " + "status:" + " "
            color: "lightGray"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: internal.fontPointSize
        }

        Flow {
            id: statusFlow

            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 5
            anchors.leftMargin: statusLabel.width
            spacing: 5

            Repeater {
                model: [ActivityView.NotInitialized, ActivityView.Ready, ActivityView.Starting,
                        ActivityView.Started]

                delegate: StatusButton {
                    statusId: modelData
                    onClicked: (value) => internal.status = value
                    highlighted: modelData === internal.status
                }
            }
        }
    }
}
