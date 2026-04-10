// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Flow Action Area")

        SectionLayout {
            PropertyLabel { text: qsTr("Outline color") }

            ColorEditor {
                backendValue: backendValues.color__AUX
                supportGradient: false
            }

            PropertyLabel { text: qsTr("Fill color") }

            ColorEditor {
                backendValue: backendValues.fillColor__AUX
                supportGradient: false
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Flow Action")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Go back")
                tooltip: qsTr("Returns to the previous flow item.")
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.goBack.valueToString
                    backendValue: backendValues.goBack
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Event IDs")
                tooltip: qsTr("IDs of the events to connect to, such as mouse, touch or keyboard events.")
            }

            SecondColumnLayout {
                LineEdit {
                    text: backendValues.goBack
                    backendValue: backendValues.eventIds
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Action type")
                tooltip: qsTr("Type of the mouse action triggering the event.")
            }

            SecondColumnLayout {
                ComboBox {
                    backendValue: backendValues.eventType
                    valueType: ComboBox.ValueType.Integer
                    model: ["Left Click", "Left Double Click", "Left Long Press", "Right Click",
                            "Right Double Click", "Right Long Press", "Flick Up", "Flick Down",
                            "Flick Left", "Flick Right", "Pinch In","Pinch Out" ]
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Action Area")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Line width")
                tooltip: qsTr("Width of the action area outline.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.width__AUX
                    maximumValue: 22
                    minimumValue: 1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Dashed line")
                tooltip: qsTr("Draws the area outline as a dashed line.")
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.dash__AUX.value
                    backendValue: backendValues.dash__AUX
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Enabled")
                tooltip: qsTr("Enables interaction with the action area during preview.")
            }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.enabled.valueToString
                    backendValue: backendValues.enabled
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
