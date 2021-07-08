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

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Flow Wildcard")

    SectionLayout {
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

        PropertyLabel { text: qsTr("Outline color") }

        ColorEditor {
            backendValue: backendValues.color__AUX
            supportGradient: false
        }

        PropertyLabel { text: qsTr("Fill color") }

        ColorEditor {
            backendValue: backendValues.fillColor__AUX
            supportGradient: false
        }

        PropertyLabel {
            text: qsTr("Global wildcard")
            tooltip: qsTr("Allows triggering the wildcard from different flows.")
        }

        SecondColumnLayout {
            CheckBox {
                backendValue: backendValues.globalWildcard
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Size")
            tooltip: qsTr("Wildcard icon size in pixels.")
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.blockSize__AUX
                minimumValue: 140
                maximumValue: 600
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Radius")
            tooltip: qsTr("Wildcard icon corner radius in pixels.")
        }

        SecondColumnLayout {
            SpinBox {
                backendValue: backendValues.blockRadius__AUX
                minimumValue: 0
                maximumValue: 100
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Allow list")
            tooltip: qsTr("Add flow items to give them high priority.")
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 5
        }

        SecondColumnLayout {
            EditableListView {
                id: positivelistView
                backendValue: backendValues.positivelist
                model: positivelistView.backendValue.expressionAsList
                Layout.fillWidth: true
                typeFilter: "FlowView.FlowItem"

                onAdd: function(value) { positivelistView.backendValue.idListAdd(value) }
                onRemove: function(idx) { positivelistView.backendValue.idListRemove(idx) }
                onReplace: function (idx, value) { positivelistView.backendValue.idListReplace(idx, value) }
            }

            ExpandingSpacer {}
        }


        PropertyLabel {
            text: qsTr("Block list")
            tooltip: qsTr("Add flow items to block them.")
            Layout.alignment: Qt.AlignTop
            Layout.topMargin: 5
        }

        SecondColumnLayout {
            EditableListView {
                id: negativelistView
                backendValue: backendValues.negativelist
                model: negativelistView.backendValue.expressionAsList
                Layout.fillWidth: true
                typeFilter: "FlowView.FlowItem"

                onAdd: function(value) { negativelistView.backendValue.idListAdd(value) }
                onRemove: function(idx) { negativelistView.backendValue.idListRemove(idx) }
                onReplace: function (idx, value) { negativelistView.backendValuet.idListReplace(idx, value) }
            }

            ExpandingSpacer {}
        }
    }
}
