/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Ultralite compatibility.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

//! [ColorizedImage compatibility]
Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Colorized Image")

    SectionLayout {
        PropertyLabel { text: qsTr("Image color") }

        ColorEditor {
            backendValue: backendValues.color
            supportGradient: false
        }

        PropertyLabel { text: qsTr("Source") }

        SecondColumnLayout {
            UrlChooser {
                backendValue: backendValues.source
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Fill mode") }

        SecondColumnLayout {
            ComboBox {
                scope: "Image"
                model: ["Stretch", "PreserveAspectFit", "PreserveAspectCrop", "Tile", "TileVertically", "TileHorizontally", "Pad"]
                backendValue: backendValues.fillMode
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Source size")
            blockedByTemplate: !backendValues.sourceSize.isAvailable
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.sourceSize_width
                minimumValue: 0
                maximumValue: 8192
                decimals: 0
                enabled: backendValue.isAvailable
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            ControlLabel {
                //: The width of the object
                text: qsTr("W", "width")
                enabled: backendValues.sourceSize_width.isAvailable
            }

            SpinBox {
                backendValue: backendValues.sourceSize_height
                minimumValue: 0
                maximumValue: 8192
                decimals: 0
                enabled: backendValue.isAvailable
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            ControlLabel {
                //: The height of the object
                text: qsTr("H", "height")
                enabled: backendValues.sourceSize_height.isAvailable
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Alignment H") }

        SecondColumnLayout {
            ComboBox {
                scope: "Image"
                model: ["AlignLeft", "AlignRight", "AlignHCenter"]
                backendValue: backendValues.horizontalAlignment
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel { text: qsTr("Alignment V") }

        SecondColumnLayout {
            ComboBox {
                scope: "Image"
                model: ["AlignTop", "AlignBottom", "AlignVCenter"]
                backendValue: backendValues.verticalAlignment
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Asynchronous")
            tooltip: qsTr("Loads images on the local filesystem asynchronously in a separate thread.")
            blockedByTemplate: !backendValues.asynchronous.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.asynchronous.isAvailable
                text: backendValues.asynchronous.valueToString
                backendValue: backendValues.asynchronous
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Auto transform")
            tooltip: qsTr("Automatically applies image transformation metadata such as EXIF orientation.")
            blockedByTemplate: !backendValues.autoTransform.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.autoTransform.isAvailable
                text: backendValues.autoTransform.valueToString
                backendValue: backendValues.autoTransform
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Cache")
            tooltip: qsTr("Caches the image.")
            blockedByTemplate: !backendValues.cache.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.cache.isAvailable
                text: backendValues.cache.valueToString
                backendValue: backendValues.cache
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Mipmap")
            tooltip: qsTr("Uses mipmap filtering when the image is scaled or transformed.")
            blockedByTemplate: !backendValues.mipmap.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.mipmap.isAvailable
                text: backendValues.mipmap.valueToString
                backendValue: backendValues.mipmap
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Mirror")
            tooltip: qsTr("Inverts the image horizontally.")
            blockedByTemplate: !backendValues.mirror.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.mirror.isAvailable
                text: backendValues.mirror.valueToString
                backendValue: backendValues.mirror
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Smooth")
            tooltip: qsTr("Smoothly filters the image when it is scaled or transformed.")
            blockedByTemplate: !backendValues.smooth.isAvailable
        }

        SecondColumnLayout {
            CheckBox {
                enabled: backendValues.smooth.isAvailable
                text: backendValues.smooth.valueToString
                backendValue: backendValues.smooth
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }
    }
}
//! [ColorizedImage compatibility]
