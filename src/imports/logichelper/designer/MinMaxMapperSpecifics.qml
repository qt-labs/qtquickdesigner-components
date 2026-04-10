// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Min Max Mapper")

    SectionLayout {
        PropertyLabel { text: qsTr("Input") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.input
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Min") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.minimum
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Max") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.maximum
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Output") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.output
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Below min") }

        SecondColumnLayout {
            CheckBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.belowMinimum
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Above max") }

        SecondColumnLayout {
            CheckBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.aboveMaximum
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Out of range") }

        SecondColumnLayout {
            CheckBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.outOfRange
            }

            ExpandingSpacer {}
        }
    }
}
