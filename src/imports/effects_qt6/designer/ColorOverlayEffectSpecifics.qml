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
        caption: qsTr("Overlay Color")

        SectionLayout {
            PropertyLabel { text: qsTr("Overlay color") }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: false
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
