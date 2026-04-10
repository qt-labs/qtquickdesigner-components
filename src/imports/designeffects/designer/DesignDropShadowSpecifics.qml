// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Layouts
import HelperWidgets
import StudioTheme as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        caption: qsTr('Design Drop Shadow <a style="color:%1;">[beta]</a>').arg(StudioTheme.Values.themeInteraction)

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel {
                text: qsTr("Visible")
                tooltip: qsTr("Toggles the visibility of the component shadow.")
            }

            SecondColumnLayout {
                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.visible
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Blur")
                tooltip: qsTr("Sets the softness of the component shadow. A larger value"
                        + " causes the edges of the shadow to appear more blurry.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.blur
                    minimumValue: 0
                    maximumValue: 250
                }

                ExpandingSpacer {}
            }

            // Spread is disabled for now as we can't tell from here if the
            // item this effect is assigned to is a Rectangle or not

            PropertyLabel {
                text: qsTr("Spread")
                tooltip: qsTr("You must select the component itself to change this property.")
                enabled: false
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.spread
                    enabled: false
                    minimumValue: -2048
                    maximumValue: 2048
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Color")
                tooltip: qsTr("Sets the color of the shadow.")
            }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Offset")
                tooltip: qsTr("Moves the shadow with respect to the component in "
                        + "X and Y coordinates by pixels.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.offsetX
                    minimumValue: -0xffff
                    maximumValue: 0xffff
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "X"
                    tooltip: qsTr("X-coordinate")
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.offsetY
                    minimumValue: -0xffff
                    maximumValue: 0xffff
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "Y"
                    tooltip: qsTr("Y-coordinate")
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Show behind")
                tooltip: qsTr("Toggles the visibility of the shadow behind a transparent component.")
            }

            SecondColumnLayout {

                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.showBehind
                }

                ExpandingSpacer {}
            }
        }
    }
}
