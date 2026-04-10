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
        caption: qsTr("Move Effect")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Direction")
                tooltip: qsTr("Direction of the effect.")
            }

            SecondColumnLayout {
                ComboBox {
                    useInteger: true
                    backendValue: backendValues.direction
                    model: ["FromLeft", "FromRight", "FromTop", "FromBottom"]
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}

