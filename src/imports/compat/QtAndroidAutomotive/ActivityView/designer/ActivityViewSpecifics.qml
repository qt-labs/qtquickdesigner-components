// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Layouts
import HelperWidgets
import StudioTheme 1.0 as StudioTheme

//! [ActivityView compatibility]
Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Activity View")

    SectionLayout {
        PropertyLabel { text: qsTr("Package name") }

        LineEdit {
            backendValue: backendValues.packageName
            Layout.fillWidth: true

        }

        PropertyLabel { text: qsTr("Class name") }

        LineEdit {
            backendValue: backendValues.className
            Layout.fillWidth: true
        }

        PropertyLabel { text: qsTr("Corner radius") }

        SecondColumnLayout {
            SpinBox {
                minimumValue: 0
                maximumValue: 128
                decimals: 0
                backendValue: backendValues.radius
                Layout.fillWidth: true
            }
        }
    }
}
//! [ActivityView compatibility]
