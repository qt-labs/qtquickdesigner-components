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
        caption: qsTr("Threshold Mask")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Spread")
                tooltip: qsTr("The smoothness of the mask edges near the threshold alpha value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.spread
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Threshold")
                tooltip: qsTr("A threshold value for the mask pixels.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.threshold
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Mask source")
                tooltip: qsTr("The component that is going to be used as the mask.")
            }

            SecondColumnLayout {
                ItemFilterComboBox {
                    typeFilter: "QtQuick.Item"
                    validator: RegExpValidator { regExp: /(^$|^[a-z_]\w*)/ }
                    backendValue: backendValues.maskSource
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
        caption: qsTr("Caching")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Cached")
                tooltip: qsTr("Caches the effect output pixels to improve the rendering "
                              + "performance.")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.cached
                    text: backendValues.cached.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
