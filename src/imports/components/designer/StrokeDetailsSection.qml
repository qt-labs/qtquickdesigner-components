/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
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

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Stroke Details")

    property bool showCapStyle: true

    property bool showBorderMode: false
    property bool showRadiusAdjustmentment: false
    property bool showJoinStyle: false
    property bool showHideLine: false

    SectionLayout {
        PropertyLabel {
            text: qsTr("Border mode")
            tooltip: qsTr("Sets the way the border gets drawn along the boundary.")
            visible: showBorderMode
        }

        SecondColumnLayout {
            visible: showBorderMode
            BorderModeComboBox {}

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Adjust radius")
            tooltip: qsTr("Toggles the corners to adapt the radius of the component.")
            visible: showRadiusAdjustmentment
        }

        SecondColumnLayout {
            visible: showRadiusAdjustmentment
            CheckBox {
                id: adjustRadiusBox
                text: qsTr("Adjust border radius")
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                backendValue: backendValues.adjustBorderRadius
            }
        }

        PropertyLabel {
            text: qsTr("Stroke style")
            tooltip: qsTr("Sets the style of the stroke. Selecting <b>None</b> would make it without a stroke.")
            }

        SecondColumnLayout {
            ComboBox {
                id: strokeStyle
                model: ["None", "Solid", "Dash", "Dot", "Dash Dot", "Dash Dot Dot"]
                backendValue: backendValues.strokeStyle
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
                useInteger: true
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Join style")
            tooltip: qsTr("Sets the style of the connecting points of the edges.")
            visible: showJoinStyle
        }

        SecondColumnLayout {
            visible: showJoinStyle
            ComboBox {
                model: ["Miter Join", "Bevel Join", "Round Join"]
                backendValue: backendValues.joinStyle
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                width: implicitWidth
                useInteger: true
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Cap style")
            tooltip: qsTr("Sets the line ends as square or rounded.")
            visible: showCapStyle
        }

        SecondColumnLayout {
            visible: showCapStyle
            CapComboBox {}

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Dash pattern")
            tooltip: qsTr("Sets the Dash length and gap in the Stroke.")
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 5
        }

        DashPatternEditor {
            enableEditors: strokeStyle.currentIndex === 2
        }

        PropertyLabel {
            text: qsTr("Dash offset")
            tooltip: qsTr("Sets the starting point of the dash pattern for a line.")
            }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.dashOffset
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                decimals: 1
                minimumValue: 0
                maximumValue: 1000
                stepSize: 1
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Hide line")
            visible: showHideLine
        }

        SecondColumnLayout {
            visible: showHideLine
            CheckBox {
                backendValue: backendValues.hideLine
                text: qsTr("hide inside line")
                implicitWidth: StudioTheme.Values.singleControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }
    }
}
