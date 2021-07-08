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
        caption: qsTr("Flow View")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Current index")
                tooltip: qsTr("Index of the flow item currently visible in the flow view.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.currentIndex__AUX
                    minimumValue: 1
                    maximumValue: 22
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                visible: !anchorBackend.hasParent
                text: qsTr("Transition color")
            }

            ColorEditor {
                visible: !anchorBackend.hasParent
                backendValue: backendValues.transitionColor__AUX
                supportGradient: false
            }

            PropertyLabel {
                visible: !anchorBackend.hasParent
                text: qsTr("Area outline color")
            }

            ColorEditor {
                visible: !anchorBackend.hasParent
                backendValue: backendValues.areaColor__AUX
                supportGradient: false
            }

            PropertyLabel {
                visible: !anchorBackend.hasParent
                text: qsTr("Area fill color")
            }

            ColorEditor {
                visible: !anchorBackend.hasParent
                backendValue: backendValues.areaFillColor__AUX
                supportGradient: false
            }

            PropertyLabel {
                visible: !anchorBackend.hasParent
                text: qsTr("Block item color")
            }

            ColorEditor {
                visible: !anchorBackend.hasParent
                backendValue: backendValues.blockColor__AUX
                supportGradient: false
            }
        }
    }

    Section {
        visible: !anchorBackend.hasParent
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Lines")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Type")
                tooltip: qsTr("Specifies how transition lines are drawn.")
            }

            SecondColumnLayout {
                ComboBox {
                    id: typeComboBox
                    valueType: ComboBox.ValueType.Integer
                    backendValue: backendValues.transitionType__AUX
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    model: [ "Default", "Bezier" ]
                    manualMapping: true

                    property bool block: false

                    onValueFromBackendChanged: {
                        if (!__isCompleted)
                            return

                        block = true

                        currentIndex = backendValues.transitionType__AUX.value

                        block = false
                    }

                    onCurrentIndexChanged: {
                        if (!__isCompleted)
                            return

                        if (block)
                            return

                        backendValues.transitionType__AUX.value = currentIndex
                    }
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Radius")
                tooltip: qsTr("Corner radius of default lines.")
            }

            SecondColumnLayout {
                SpinBox {
                    enabled: typeComboBox.currentIndex === 0
                    backendValue: backendValues.transitionRadius__AUX
                    minimumValue: 0
                    maximumValue: 150
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Bezier factor")
                tooltip: qsTr("Position of the control points used for bezier curves.")
            }

            SecondColumnLayout {
                SpinBox {
                    enabled: typeComboBox.currentIndex === 1
                    backendValue: backendValues.transitionBezier__AUX
                    minimumValue: 0
                    maximumValue: 150
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
