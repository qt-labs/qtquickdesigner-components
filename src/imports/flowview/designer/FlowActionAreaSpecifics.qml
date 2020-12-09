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
   Section {
       anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("FlowAction Parameters")
        SectionLayout {
             rows: 2
             columns: 2

             Label {
                 text: qsTr("Go Back")
                 tooltip: qsTr("")
             }
             CheckBox {
                 Layout.fillWidth: true
                 text: backendValues.goBack
                 backendValue: backendValues.goBack
             }

             Label {
                 text: qsTr("Event Ids")
                 tooltip: qsTr("")
             }
             LineEdit {
                 Layout.fillWidth: true
                 text: backendValues.goBack
                 backendValue: backendValues.eventIds
             }
             Label {
                 text: qsTr("Action Type")
                 tooltip: qsTr("Type of the mouse action triggering the event")

             }

             ComboBox {
                 visible: showElide
                 Layout.fillWidth: true
                 backendValue: backendValues.eventType
                 valueType: ComboBox.ValueType.Integer

                 model: ["Left Click", "Left Double Click", "Left Long Press", "Right Click", "Right Double Click",
                     "Right Long Press", "Flick Up", "Flick Down", "Flick Left", "Flick Right", "Pinch In","Pinch Out" ]
             }

        }
   }
    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Parameters")

         SectionLayout {
             rows: 4
             columns: 2

             Label {
                 text: qsTr("Line Width")
                 tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
             }
             SpinBox {
                 backendValue: backendValues.width__AUX
                 maximumValue: 22
                 minimumValue: 1
             }

             Label {
                 text: qsTr("Dash Line")
                 tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
             }
             CheckBox {
                 Layout.fillWidth: true
                 text: backendValues.dash__AUX.value
                 backendValue: backendValues.dash__AUX
             }

             Label {
                 text: qsTr("Enabled")
                 tooltip: qsTr("Sets the margin, in pixels, around the text in the TextEdit..")
             }
             CheckBox {
                 Layout.fillWidth: true
                 text: backendValues.enabled
                 backendValue: backendValues.enabled
             }

         }
   }
}
