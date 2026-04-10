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
        caption: qsTr("Straight Arrow")

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel { text: qsTr("Color") }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: true
                shapeGradients: true
            }

            PropertyLabel { text: qsTr("Thickness") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.thickness
                    decimals: 1
                    minimumValue: 1
                    maximumValue: 500
                    stepSize: 1
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Arrow Size") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.arrowSize
                    decimals: 1
                    minimumValue: 1
                    maximumValue: 500
                    stepSize: 1
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Radius") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.radius
                    decimals: 1
                    minimumValue: 1
                    maximumValue: 500
                    stepSize: 1
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Flip") }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.round.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.flip
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Rotate") }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.round.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.rotate
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Corner") }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.round.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.corner
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Flip Corner") }

            SecondColumnLayout {
                CheckBox {
                    text: backendValues.round.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.flipCorner
                }

                ExpandingSpacer {}
            }
        }
    }
}
