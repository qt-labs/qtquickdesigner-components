/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
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

import QtQuick 2.0
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Fill Color")

        ColorEditor {
            caption: qsTr("Fill Color")
            backendValue: backendValues.fillColor
            supportGradient: false
        }


    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Stroke Color")

        ColorEditor {
            caption: qsTr("Stroke Color")
            backendValue: backendValues.strokeColor
            supportGradient: false
        }
    }


    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: "Stroke Details"

        SectionLayout {
            rows: 2
            Label {
                text: qsTr("Stroke Width")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.strokeWidth
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 10000
                    stepSize: 1
                }
                ExpandingSpacer {

                }
            }
            Label {
                text: qsTr("Begin")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.begin
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 1
                }
                ExpandingSpacer {

                }
            }
            Label {
                text: qsTr("End")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.end
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 1
                }
                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Stroke Style")
            }

            SecondColumnLayout {
                ComboBox {
                    id: strokeStyle
                    model: ["None", "Solid", "Dash", "Dot", "Dash Dot", "Dash Dot Dot"]
                    backendValue: backendValues.strokeStyle
                    Layout.fillWidth: true
                    useInteger: true
                }

            }

            Label {
                Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                text: qsTr("Dash Pattern")
            }

            DashPatternEditor {
                enableEditors: strokeStyle.currentIndex === 2
            }

            Label {
                text: qsTr("Cap Style")
            }

            SecondColumnLayout {
                CapComboBox {
                }
            }

            Label {
                text: qsTr("Dash Offset")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.dashOffset
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
            Label {
                text: qsTr("Anti Aliasing")
            }
            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.antialiasing
                    text: qsTr("Anti Aliasing")
                }
                ExpandingSpacer {

                }
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Outline")
        SectionLayout {
            rows: 2

            Label {
                text: qsTr("Full Outline")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.outlineArc
                }
            }

            Label {
                text: qsTr("Arc Outline Width")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.arcWidth
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
            Label {
                text: qsTr("Arc Outline Begin")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.arcWidthBegin
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
            Label {
                text: qsTr("Arc Outline End")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.arcWidthEnd
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
            Label {
                text: qsTr("Round Outline")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.round
                }
            }

            Label {
                text: qsTr("Round End Outline")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.roundBegin
                }
            }
            Label {
                text: qsTr("Round End Outline")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.roundEnd
                }
            }


            Label {
                text: qsTr("Radius Inner Adjust")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.radiusInnerAdjust
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
            Label {
                text: qsTr("Radius Outer Adjust")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.radiusOuterAdjust
                    Layout.preferredWidth: 80
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 1000
                    stepSize: 1
                }
            }
        }
    }
}
