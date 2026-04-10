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
        caption: qsTr("Multi Text")

        SectionLayout {
            PropertyLabel { text: qsTr("Baseline offset") }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.baselineOffset
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    StandardTextSection {
        showVerticalAlignment: true
        showFormatProperty: true
        showElide: true
        showFontSizeMode: true
        showLineHeight: true
        richTextEditorAvailable: true
    }

    FontSection {
        showStyle: true
    }

    PaddingSection {}
}
