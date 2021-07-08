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
        caption: qsTr("Transition")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Condition")
                tooltip: qsTr("Determines whether the transition is active.")
            }

            SecondColumnLayout {
                CheckBox {
                    text: qsTr("Transition active")
                    backendValue: backendValues.condition
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel { text: qsTr("Transition Color") }

            ColorEditor {
                backendValue: backendValues.color__AUX
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Question")
                tooltip: qsTr("The transition shows a dialog with the question.")
            }

            SecondColumnLayout {
                LineEdit {
                    backendValue: backendValues.question
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Event IDs")
                tooltip: qsTr("IDs of the events to connect to, such as mouse, touch or keyboard events.")
            }

            SecondColumnLayout {
                LineEdit {
                    text: backendValues.goBack
                    backendValue: backendValues.eventIds
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("From")
                tooltip: qsTr("Flow item where the transition starts.")
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 5
            }

            SecondColumnLayout {
                EditableListView {
                    id: fromListView
                    backendValue: backendValues.from
                    model: fromListView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { fromListView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { fromListView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { fromListView.backendValue.idListReplace(idx, value) }
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("To")
                tooltip: qsTr("Flow item where the transition ends.")
                Layout.alignment: Qt.AlignTop
                Layout.topMargin: 5
            }

            SecondColumnLayout {
                EditableListView {
                    id: toListView
                    backendValue: backendValues.to
                    model: toListView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { toListView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { toListView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { toListView.backendValue.idListReplace(idx, value) }
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Line")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Line width")
                tooltip: qsTr("Width of the transition line.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.width__AUX
                    maximumValue: 22
                    minimumValue: 1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Offset")
                tooltip: qsTr("Sets the start/end point of the line to the specified value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.inOffset__AUX
                    maximumValue: 128
                    minimumValue: -128
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: qsTr("In")
                    horizontalAlignment: Text.AlignLeft
                }

                Spacer { implicitWidth: StudioTheme.Values.controlGap }

                SpinBox {
                    backendValue: backendValues.outOffset__AUX
                    maximumValue: 128
                    minimumValue: -128
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: qsTr("Out")
                    horizontalAlignment: Text.AlignLeft
                    width: StudioTheme.Values.controlLabelWidth
                           + StudioTheme.Values.controlGap
                           + StudioTheme.Values.linkControlWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Break offset")
                tooltip: qsTr("Sets the break of the line to the specified value.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.breakPoint__AUX
                    maximumValue: 100
                    minimumValue: 0
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Dashed line")
                tooltip: qsTr("Draws a dashed line.")
            }

            SecondColumnLayout {
                CheckBox {
                    Layout.fillWidth: true
                    text: backendValues.dash__AUX.value
                    backendValue: backendValues.dash__AUX
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Type")
                tooltip: qsTr("Specifies how the line is drawn.")
            }

            SecondColumnLayout {
                ComboBox {
                    id: typeComboBox
                    valueType: ComboBox.ValueType.Integer
                    backendValue: backendValues.type__AUX
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    model: ["Default", "Bezier"]
                    manualMapping: true

                    property bool block: false

                    onValueFromBackendChanged: {
                        if (!__isCompleted)
                            return

                        block = true
                        currentIndex = backendValues.type__AUX.value
                        block = false
                    }

                    onCurrentIndexChanged: {
                        if (!__isCompleted)
                            return

                        if (block)
                            return

                        backendValues.type__AUX.value = currentIndex
                    }
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Radius")
                tooltip: qsTr("Corner radius of a default line.")
            }

            SecondColumnLayout {
                SpinBox {
                    enabled: typeComboBox.currentIndex === 0
                    backendValue: backendValues.radius__AUX
                    minimumValue: 0
                    maximumValue: 150
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Bezier factor")
                tooltip: qsTr("Position of the control points used for a bezier curve.")
            }

            SecondColumnLayout {
                SpinBox {
                    enabled: typeComboBox.currentIndex === 1
                    backendValue: backendValues.bezier__AUX
                    minimumValue: 0
                    maximumValue: 150
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Label position")
                tooltip: qsTr("Position of the label attached to the line.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.labelPosition__AUX
                    minimumValue: 0
                    maximumValue: 100
                    decimals: 2
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Label flip side")
                tooltip: qsTr("Flips the label to the other side of the line.")
            }

            SecondColumnLayout {
                CheckBox {
                    Layout.fillWidth: true
                    text: backendValues.labelFlipSide__AUX.value
                    backendValue: backendValues.labelFlipSide__AUX
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
