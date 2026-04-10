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
        caption: qsTr("Hue and Saturation")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Hue")
                tooltip: qsTr("The hue value which is added to the source hue value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.hue
                    decimals: 2
                    minimumValue: -1
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Lightness")
                tooltip: qsTr("The lightness value which is added to the source saturation value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.lightness
                    decimals: 2
                    minimumValue: -1
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Saturation")
                tooltip: qsTr("The saturation value value which is added to the source saturation "
                              + "value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.saturation
                    decimals: 2
                    minimumValue: -1
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
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
