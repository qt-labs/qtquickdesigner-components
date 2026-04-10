// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.15

QtObject {
    id: root

    property list<FlowTransition> targets

    readonly property bool isFlowDecision: true

    property string dialogTitle: qsTr("Title")

    function trigger() {
        var hasDialog = false
        for (var i = 0; i <  root.targets.length; ++i) {
            if (root.targets[i].question !== "")
                hasDialog = true
        }

        if (hasDialog) {
            loader.show()
        }
    }

    property Loader loader: Loader {
        active: false
        function show() {
            active = true
            item.show()
            item.raise()
            item.requestActivate()
        }

        sourceComponent: windowComponent
    }

    property Component windowComponent:  Component {

        Window {

            id: dialog

            title: root.dialogTitle
            modality: Qt.WindowModal
            transientParent: root.Window.window

            width: 400
            height: column.height

            minimumWidth: 400
            minimumHeight: 100
            flags: Qt.Dialog | Qt.WindowStaysOnTopHint | Qt.WindowTitleHint

            Rectangle {
                id: background
                anchors.fill: parent

                ScrollView {
                    anchors.fill: parent


                    Column {
                        id: column
                        Repeater {
                            model: targets
                            Rectangle {
                                visible: root.targets[index].question !== ""
                                width: background.width
                                height: 20
                                opacity: mouseArea.containsMouse ? 1 : 0.8
                                color: index / 2 ? "#ebecf0" : "white"
                                MouseArea {
                                    id: mouseArea
                                    hoverEnabled: true
                                    onClicked: {
                                        root.targets[index].__decisionTrigger()
                                        loader.item.close()
                                        loader.active = false
                                    }
                                    anchors.fill: parent
                                }

                                Text {
                                    height: 20
                                    text: root.targets[index].question
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}
