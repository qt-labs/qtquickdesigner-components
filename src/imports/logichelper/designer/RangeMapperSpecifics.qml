// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Ranger Mapper")

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

        PropertyLabel { text: qsTr("Input min") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.inputMinimum
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Input max") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.inputMaximum
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Output min") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.outputMinimum
                decimals: 2
                minimumValue: -Number.MAX_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Output max") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.outputMaximum
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
    }
}
