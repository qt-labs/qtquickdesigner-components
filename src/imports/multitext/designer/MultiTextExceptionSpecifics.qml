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
        caption: qsTr("Multi Text Exception")

        SectionLayout {
            PropertyLabel { text:  qsTr("Language exception") }

            SecondColumnLayout {
                ComboBox {
                    id: textComboBox
                    valueType: ComboBox.ValueType.Integer
                    manualMapping: true
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    model: [
                        "[None]",
                        "Arabic-Egypt (ar)",
                        "Chinese-China (zh)",
                        "Czech-Czech Republic (cs)",
                        "Danish-Denmark (da)",
                        "Dutch-Netherlands (nl)",
                        "English-Australia (en-AU)",
                        "English-United Kingdom (en-GB)",
                        "English-United States (en)",
                        "Finnish-Finland (fi)",
                        "Hebrew-Israel (he)",
                        "Hindi-India (hi)",
                        "Hungarian-Hungary (hu)",
                        "French-France (fr)",
                        "French-Canada (fr-CA)",
                        "German-Germany (de)",
                        "Italian-Italy (it)",
                        "Japanese-Japan (ja)",
                        "Korean-South Korea (ko)",
                        "Norwegian Bokmal-Norway (nb)",
                        "Persian-Iran (fa)",
                        "Polish-Poland (pl)",
                        "Portuguese-Brazil (pt)",
                        "Portuguese-Portugal (pt-PT)",
                        "Romanian-Romania (ro)",
                        "Russian-Russia (ru)",
                        "Slovak-Slovakia (sk)",
                        "Slovenian-Slovenia (sl)",
                        "Swedish-Sweden (sv)",
                        "Spanish-Spain (es)",
                        "Spanish-Mexico (es-MX)",
                        "Turkish-Turkey (tr)",
                        "Ukrainian-Ukraine (uk)" ]

                    onCurrentTextChanged: {
                        if (textComboBox.currentText === "[None]") {
                            backendValues.languageCode.resetValue()
                            return
                        }

                        var myReg = /\(([^()]*)\)/g;
                        var result = myReg.exec(textComboBox.currentText);
                        backendValues.languageCode.value = result[1]
                    }
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Exception active") }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.exceptionAcive
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
