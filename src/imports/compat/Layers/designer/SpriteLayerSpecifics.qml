// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

//! [SpriteLayer compatibility]
Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Sprite Layer")

    SectionLayout {
        PropertyLabel { text: qsTr("Platform ID") }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.platformId
                minimumValue: 0
                maximumValue: 2000
                decimals: 0
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Depth") }

        SecondColumnLayout {
            ComboBox {
                model: ["Bpp8", "Bpp16", "Bpp16Alpha", "Bpp24", "Bpp32", "Bpp32Alpha"]
                backendValue: backendValues.depth
                scope: "SpriteLayer"
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
            }

            ExpandingSpacer {}
        }
    }
}
//! [SpriteLayer compatibility]
