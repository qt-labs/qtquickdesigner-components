// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Transition Effect")

    SectionLayout {
        PropertyLabel {
            text: qsTr("Duration")
            tooltip: qsTr("Duration of the effect.")
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.duration
                maximumValue: 10000
                minimumValue: 0
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Easing curve")
            tooltip: qsTr("Defines a custom easing curve for the effect.")
        }

        SecondColumnLayout {
            BoolButtonRowButton {
                buttonIcon: StudioTheme.Constants.curveDesigner
                EasingCurveEditor {
                    id: easingCurveEditor
                    modelNodeBackendProperty: modelNodeBackend
                }
                onClicked: easingCurveEditor.runDialog()
            }

            ExpandingSpacer {}
        }
    }
}
