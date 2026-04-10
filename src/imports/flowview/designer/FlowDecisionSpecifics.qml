// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Flow Decision")

    SectionLayout {
        PropertyLabel {
            text: qsTr("Dialog title")
            tooltip: qsTr("Title of the decision dialog.")
        }

        SecondColumnLayout {
            LineEdit {
                backendValue: backendValues.dialogTitle
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Label position")
            tooltip: qsTr("Position of the label.")
        }

        SecondColumnLayout {
            ComboBox {
                enabled: showLabel.checked
                valueType: ComboBox.ValueType.Integer
                backendValue: backendValues.dialogLabelPosition__AUX
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
                model: ["TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner"]
                currentIndex: 1 // TopRightCorner is the default
                manualMapping: true

                property bool block: false

                onValueFromBackendChanged: {
                    if (!__isCompleted)
                        return;

                    block = true
                    currentIndex = backendValues.dialogLabelPosition__AUX.value
                    block = false
                }

                onCurrentIndexChanged: {
                    if (!__isCompleted)
                        return;

                    if (block)
                        return;

                    backendValues.dialogLabelPosition__AUX.value = currentIndex
                }
            }

            Spacer { implicitWidth: StudioTheme.Values.twoControlColumnGap }

            IconIndicator {
                id: showLabel
                property var backendValue: backendValues.showDialogLabel__AUX
                property bool checked: showLabel.backendValue.value
                icon: showLabel.checked ? StudioTheme.Constants.visibilityOn
                                        : StudioTheme.Constants.visibilityOff
                pixelSize: StudioTheme.Values.myIconFontSize + 4

                onClicked: {
                    showLabel.backendValue.value = !showLabel.backendValue.value
                }
            }

            ExpandingSpacer {}
        }

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

        PropertyLabel {
            text: qsTr("Size")
            tooltip: qsTr("Flow decision icon size in pixels.")
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.blockSize__AUX
                minimumValue: 140
                maximumValue: 600
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Radius")
            tooltip: qsTr("Flow decision icon corner radius in pixels.")
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.blockRadius__AUX
                minimumValue: 0
                maximumValue: 100
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }
    }
}
