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
            PropertyLabel { text:  qsTr("Text element") }

            SecondColumnLayout {
                ComboBox {
                    id: textComboBox
                    valueType: ComboBox.ValueType.Integer
                    manualMapping: true
                    currentIndex: backendValues.stringIndex.value
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    model: backendValues.textModel.value.split('e\u001f' + 'e\u001d')

                    onCurrentIndexChanged: {
                        backendValues.currentIndex.value =  textComboBox.currentIndex
                    }
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("String index") }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.currentIndex
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
