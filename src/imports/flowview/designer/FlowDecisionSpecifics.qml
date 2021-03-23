/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
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

import QtQuick 2.1
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Flow Decision")

        SectionLayout {
            rows: 5
            columns: 2

            Label {
                text: qsTr("Dialog title")
                tooltip: qsTr("Title of the decision dialog.")
            }
            LineEdit {
                backendValue: backendValues.dialogTitle
                Layout.fillWidth: true
            }

            Label {
                text: qsTr("Show label")
                tooltip: qsTr("Shows the dialog title as a label.")
            }
            CheckBox {
                id: showLabelCheckBox
                Layout.fillWidth: true
                text: backendValues.showDialogLabel__AUX.value
                backendValue: backendValues.showDialogLabel__AUX
            }

            Label {
                text: qsTr("Label position")
                tooltip: qsTr("Position of the label.")
            }
            ComboBox {
                enabled: showLabelCheckBox.checkState === Qt.Checked
                valueType: ComboBox.ValueType.Integer
                backendValue: backendValues.dialogLabelPosition__AUX
                implicitWidth: 180
                model: ["TopLeftCorner", "TopRightCorner", "BottomLeftCorner", "BottomRightCorner"]
                manualMapping: true

                property bool block: false

                onValueFromBackendChanged: {
                    if (!__isCompleted)
                        return;

                    block = true
                    currentIndex = backendValues.dialogLabelPosition__AUX.value
                    block = false
                }

                onCurrentIndexChanged: {
                    if (!__isCompleted)
                        return;

                    if (block)
                        return;

                    backendValues.dialogLabelPosition__AUX.value = currentIndex
                }
            }

            Label {
                text: qsTr("Size")
                tooltip: qsTr("Flow decision icon size in pixels.")
            }
            SpinBox {
                backendValue: backendValues.blockSize__AUX
                minimumValue: 140
                maximumValue: 600
            }

            Label {
                text: qsTr("Radius")
                tooltip: qsTr("Flow decision icon corner radius in pixels.")
            }
            SpinBox {
                backendValue: backendValues.blockRadius__AUX
                minimumValue: 0
                maximumValue: 100
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Outline Color")

        ColorEditor {
            backendValue: backendValues.color__AUX
            supportGradient: false
        }
    }
    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Fill Color")

        ColorEditor {
            backendValue: backendValues.fillColor__AUX
            supportGradient: false
        }
    }
}
