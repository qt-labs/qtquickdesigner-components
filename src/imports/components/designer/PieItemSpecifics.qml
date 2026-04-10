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
        caption: qsTr("Pie Item")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Fill color")
                tooltip: qsTr("Sets the color to fill the Pie.")
            }

            ColorEditor {
                backendValue: backendValues.fillColor
                supportGradient: true
                shapeGradients: true
            }

            PropertyLabel {
                text: qsTr("Stroke color")
                tooltip: qsTr("Sets the stroke color of the boundary.")
            }

            ColorEditor {
                backendValue: backendValues.strokeColor
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Stroke width")
                tooltip: qsTr("Sets the stroke thickness of the boundary.")
            }

            SecondColumnLayout {
                SpinBox {
                    id: strokeWidthSpinBox
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.strokeWidth
                    decimals: 1
                    minimumValue: -1
                    maximumValue: 200
                    stepSize: 1

                    property real previousValue: 0

                    onValueChanged: {
                        if (strokeWidthSpinBox.value > 0)
                            strokeWidthSpinBox.previousValue = strokeWidthSpinBox.value
                    }

                    Component.onCompleted: strokeWidthSpinBox.previousValue
                                           = Math.max(1, backendValues.strokeWidth.value)
                }

                Spacer {
                    implicitWidth: StudioTheme.Values.twoControlColumnGap
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                CheckBox {
                    id: strokeWidthCheckBox
                    text: qsTr("Hide")
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                    checked: (backendValues.strokeWidth.value < 0)
                    actionIndicator.visible: false

                    onCheckedChanged: backendValues.strokeWidth.value
                                      = (strokeWidthCheckBox.checked ? -1 : strokeWidthSpinBox.previousValue)
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Pie start")
                tooltip: qsTr("Sets the starting angle of the Pie.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.begin
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 1
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel { text: "°" }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Pie end")
                tooltip: qsTr("Sets the ending angle of the Pie.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.end
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 1
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel { text: "°" }

                ExpandingSpacer {}
            }
        }
    }

    StrokeDetailsSection {
        showHideLine: true
    }
}
