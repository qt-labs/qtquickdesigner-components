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
        caption: qsTr('Design Inner Shadow <a style="color:%1;">[beta]</a>').arg(StudioTheme.Values.themeInteraction)

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel {
                text: qsTr("Visible")
                tooltip: qsTr("Toggles the visibility of the component shadow.")
            }

            SecondColumnLayout {
                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.visible
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Blur")
                tooltip: qsTr("Sets the softness of the component shadow. A larger value"
                        + " causes the edges of the shadow to appear more blurry.")
            }

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
                tooltip: qsTr("You must select the component itself to change this property.")
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
                tooltip: qsTr("Sets the color of the shadow.")
            }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Offset")
                tooltip: qsTr("Moves the shadow with respect to the component in "
                        + "X and Y coordinates by pixels.")
            }

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
        }
    }
}
