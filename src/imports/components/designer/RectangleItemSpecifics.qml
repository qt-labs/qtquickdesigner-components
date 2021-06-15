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

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Rectangle Item")

        SectionLayout {
            PropertyLabel { text: qsTr("Fill Color") }

            ColorEditor {
                backendValue: backendValues.fillColor
                supportGradient: true
                shapeGradients: true
            }

            PropertyLabel { text: qsTr("Stroke Color") }

            ColorEditor {
                backendValue: backendValues.strokeColor
                supportGradient: false
            }

            PropertyLabel { text: qsTr("Stroke Width") }

            SecondColumnLayout {
                SpinBox {
                    id: strokeWidthSpin
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.strokeWidth
                    decimals: 1
                    minimumValue: -1
                    maximumValue: 200
                    stepSize: 1
                }

                Spacer {
                    implicitWidth: StudioTheme.Values.twoControlColumnGap
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                CheckBox {
                    id: strokeWidthCheck
                    text: qsTr("Hide")
                    checked: (backendValues.strokeWidth.value >= 0 ? false : true)
                    actionIndicator.visible: false
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth

                    onCheckedChanged: {
                        if (strokeWidthCheck.checked === true)
                            backendValues.strokeWidth.value = -1
                        else
                            backendValues.strokeWidth.value = ((backendValues.strokeWidth.value < 0) ? 4 : backendValues.strokeWidth.value)
                    }
                }

                ExpandingSpacer {}
            }
        }
    }

    CornerRadiusSection {}

    BevelSection {}

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Stroke Details")

        SectionLayout {
            PropertyLabel { text: qsTr("Border mode") }

            SecondColumnLayout {
                BorderModeComboBox {}

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Stroke style") }

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

            PropertyLabel { text: qsTr("Join style") }

            SecondColumnLayout {
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

            PropertyLabel { text: qsTr("Dash pattern") }

            DashPatternEditor {
                enableEditors: strokeStyle.currentIndex === 2
            }

            PropertyLabel { text: qsTr("Dash offset") }

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
        }
    }
}
