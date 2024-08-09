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
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Regular Polygon Item")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Fill color")
                tooltip: qsTr("Sets the color to fill the enclosed Regular Polygon.")
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

            PropertyLabel {
                text: qsTr("Side count")
                tooltip: qsTr("Sets the number of edges for the Regular Polygon.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.sideCount
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 0
                    minimumValue: 3
                    maximumValue: 100
                    stepSize: 1
                }

                ExpandingSpacer {}
            }
        }
    }

    StrokeDetailsSection {
        showBorderMode: false
        showJoinStyle: true
        showCapStyle: false
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Radiuses")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Radius")
                tooltip: qsTr("Sets the radius of the corners in the Regular Polygon.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.radius
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    decimals: 0
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                MultiIconLabel {
                    icon0: StudioTheme.Constants.triangleCornerB
                    icon1: StudioTheme.Constants.triangleCornerA
                }

                ExpandingSpacer {}
            }
        }
    }
}
