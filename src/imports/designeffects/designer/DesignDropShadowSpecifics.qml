/****************************************************************************
**
** Copyright (C) 2024 The Qt Company Ltd.
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

import QtQuick
import QtQuick.Layouts
import HelperWidgets
import StudioTheme as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        caption: qsTr('Design Drop Shadow <a style="color:%1;">[beta]</a>').arg(StudioTheme.Values.themeInteraction)

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel { text: qsTr("Visible") }

            SecondColumnLayout {
                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.visible
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Blur") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.blur
                    minimumValue: 0
                    maximumValue: 250
                }

                ExpandingSpacer {}
            }

            // Spread is disabled for now as we can't tell from here if the
            // item this effect is assigned to is a Rectangle or not

            PropertyLabel {
                text: qsTr("Spread")
                enabled: false
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.spread
                    enabled: false
                    minimumValue: -2048
                    maximumValue: 2048
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Color")
                tooltip: qsTr("Sets the color.")
            }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: false
            }

            PropertyLabel { text: qsTr("Offset") }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.offsetX
                    minimumValue: -0xffff
                    maximumValue: 0xffff
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "X"
                    tooltip: qsTr("X-coordinate")
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.offsetY
                    minimumValue: -0xffff
                    maximumValue: 0xffff
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "Y"
                    tooltip: qsTr("Y-coordinate")
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Show behind") }

            SecondColumnLayout {

                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.showBehind
                }

                ExpandingSpacer {}
            }
        }
    }
}
