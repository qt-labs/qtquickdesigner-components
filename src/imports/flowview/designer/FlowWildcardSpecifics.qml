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
        caption: qsTr("Flow Wildcard")

        SectionLayout {
            rows: 5
            columns: 2

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
                text: qsTr("Whitelist")
            }
            SecondColumnLayout {
                EditableListView {
                    id: whitelistView
                    backendValue: backendValues.whitelist
                    model: whitelistView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { whitelistView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { whitelistView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { whitelistView.backendValue.idListReplace(idx, value) }
                }
            }
            Label {
                text: qsTr("Blacklist")
            }
            SecondColumnLayout {
                EditableListView {
                    id: blackListView
                    backendValue: backendValues.blacklist
                    model: blackListView.backendValue.expressionAsList
                    Layout.fillWidth: true
                    typeFilter: "FlowView.FlowItem"

                    onAdd: function(value) { blackListView.backendValue.idListAdd(value) }
                    onRemove: function(idx) { blackListView.backendValue.idListRemove(idx) }
                    onReplace: function (idx, value) { blackListView.backendValuet.idListReplace(idx, value) }
                }
            }

            Label {
                text: qsTr("Size")
                tooltip: qsTr("Sets the size in pixels.")
            }
            SpinBox {
                backendValue: backendValues.blockSize__AUX
                minimumValue: 140
                maximumValue: 600
            }

            Label {
                text: qsTr("Radius")
                tooltip: qsTr("Sets the radius in pixels.")
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
