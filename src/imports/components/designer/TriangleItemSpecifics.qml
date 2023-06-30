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
import StudioControls 1.0 as StudioControls
import StudioTheme 1.0 as StudioTheme

Column {
    id: root
    anchors.left: parent.left
    anchors.right: parent.right

    property int spinBoxWidth: 100

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Triangle Item")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Fill color")
                tooltip: qsTr("Sets the color to fill the Triangle.")
                }

            ColorEditor {
                backendValue: backendValues.fillColor
                supportGradient: true
                shapeGradients: true
            }

            PropertyLabel {
                text: qsTr("Stroke color")
                tooltip: qsTr("Sets the stroke color of the boundary.")
                }

            ColorEditor {
                backendValue: backendValues.strokeColor
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Stroke width")
                tooltip: qsTr("Sets the stroke thickness of the boundary.")
                }

            SecondColumnLayout {
                SpinBox {
                    id: strokeWidthSpinBox
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.strokeWidth
                    decimals: 1
                    minimumValue: -1
                    maximumValue: 200
                    stepSize: 1

                    property real previousValue: 0

                    onValueChanged: {
                        if (strokeWidthSpinBox.value > 0)
                            strokeWidthSpinBox.previousValue = strokeWidthSpinBox.value
                    }

                    Component.onCompleted: strokeWidthSpinBox.previousValue
                                           = Math.max(1, backendValues.strokeWidth.value)
                }

                Spacer {
                    implicitWidth: StudioTheme.Values.twoControlColumnGap
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                CheckBox {
                    id: strokeWidthCheckBox
                    text: qsTr("Hide")
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                    checked: (backendValues.strokeWidth.value < 0)
                    actionIndicator.visible: false

                    onCheckedChanged: backendValues.strokeWidth.value
                                      = (strokeWidthCheckBox.checked ? -1 : strokeWidthSpinBox.previousValue)
                }

                ExpandingSpacer {}
            }
        }
    }

    StrokeDetailsSection {
        showCapStyle: false
        showJoinStyle: true
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Radiuses")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Radius")
                tooltip: qsTr("Sets the radius of the corners and the radius for the edges of the intersections in the Triangle.")
                }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.radius
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: 0
                    maximumValue: backendValues.maxRadius.value
                    stepSize: 1
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.triangleCornerB
                    icon1: StudioTheme.Constants.triangleCornerA
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    backendValue: backendValues.arcRadius
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: 1
                    maximumValue: 10000
                    stepSize: 1
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.triangleArcB
                    icon1: StudioTheme.Constants.triangleArcA
                }
/*
                TODO QDS-4836
                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                LinkIndicator2D {}
*/

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Margin")

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel {
                text: qsTr("Vertical")
                tooltip: qsTr("Sets the top and bottom margins for the Triangle component.")
                }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -10000
                    maximumValue: 10000
                    stepSize: 1
                    backendValue: backendValues.topMargin
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.paddingFrame
                    icon1: StudioTheme.Constants.paddingEdge
                    iconColor: StudioTheme.Values.themeTextColor
                    tooltip: qsTr("The margin above the item.")
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    id: spinBoxBottomMargin
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -10000
                    maximumValue: 10000
                    stepSize: 1
                    backendValue: backendValues.bottomMargin
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.paddingFrame
                    icon1: StudioTheme.Constants.paddingEdge
                    iconColor: StudioTheme.Values.themeTextColor
                    rotation: 180
                    tooltip: qsTr("The margin below the item.")
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Horizontal")
                tooltip: qsTr("Sets the left and right margins for the Triangle component.")
                }

            SecondColumnLayout {
                SpinBox {
                    id: spinBoxLeftMargin
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -10000
                    maximumValue: 10000
                    stepSize: 1
                    backendValue: backendValues.leftMargin
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.paddingFrame
                    icon1: StudioTheme.Constants.paddingEdge
                    iconColor: StudioTheme.Values.themeTextColor
                    rotation: 270
                    tooltip: qsTr("The left margin of the item.")
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    id: spinBoxRightMargin
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 1
                    minimumValue: -10000
                    maximumValue: 10000
                    stepSize: 1
                    backendValue: backendValues.rightMargin
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.paddingFrame
                    icon1: StudioTheme.Constants.paddingEdge
                    iconColor: StudioTheme.Values.themeTextColor
                    rotation: 90
                    tooltip: qsTr("The right margin of the item.")
                }

                ExpandingSpacer {}
            }
        }
    }
}
