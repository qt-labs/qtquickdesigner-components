// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("String Mapper")

    SectionLayout {
        PropertyLabel { text: qsTr("Input") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.input
                decimals: 2
                minimumValue: Number.MIN_VALUE
                maximumValue: Number.MAX_VALUE
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Decimal places") }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.decimals
                minimumValue: 0
                maximumValue: 20
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Output text") }

        SecondColumnLayout {
            LineEdit {
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.text
                showTranslateCheckBox: false
            }

            ExpandingSpacer {}
        }
    }
}
