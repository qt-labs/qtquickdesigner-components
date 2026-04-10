// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    FlowEffectSection {}

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Push Effect")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Direction")
                tooltip: qsTr("Direction of the effect.")
            }

            SecondColumnLayout {
                ComboBox {
                    useInteger: true
                    backendValue: backendValues.direction
                    model: ["FromLeft", "FromRight", "FromBottom", "FromTop"]
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Scale")
                tooltip: qsTr("Adds scaling to the effect.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.scale
                    maximumValue: 2
                    minimumValue: 0.01
                    hasSlider: true
                    decimals: 2
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Incoming opacity")
                tooltip: qsTr("Opacity of the effect at the end of the transition.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.inOpacity
                    maximumValue: 1
                    minimumValue: 0
                    hasSlider: true
                    decimals: 2
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Outgoing opacity")
                tooltip: qsTr("Opacity of the effect at the start of the transition.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.outOpacity
                    maximumValue: 1
                    minimumValue: 0
                    hasSlider: true
                    decimals: 2
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Reveal")
                tooltip: qsTr("Reveals the flow item where the transition starts.")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.revealCurrent
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
