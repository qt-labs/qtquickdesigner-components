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
        caption: qsTr("Flow Item")

        SectionLayout {
            PropertyLabel {
                text: qsTr("State change target")
                tooltip: qsTr("Flow item to change the state of.")
            }

            SecondColumnLayout {
                ItemFilterComboBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    typeFilter: "FlowView.FlowItem"
                    validator: RegExpValidator { regExp: /(^$|^[a-z_]\w*)/ }
                    backendValue: backendValues.stateChangeTarget
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Target state")
                tooltip: qsTr("Applies the selected state.")
            }

            SecondColumnLayout {
                ComboBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.targetState
                    model: allStatesForId(backendValues.stateChangeTarget.expression)
                    valueType: ComboBox.String
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Loader source")
                tooltip: qsTr("Includes the selected flow view into the current flow view as a flow item.")
            }

            SecondColumnLayout {
                UrlChooser {
                    backendValue: backendValues.loaderSource
                    filter: "*.ui.qml"
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Force active")
                tooltip: qsTr("Loads the specified QML file even if the FlowItem is inactive.")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.forceActive
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        visible: anchorBackend.hasParent
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Transition Lines")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Join lines")
                tooltip: qsTr("Draws transition lines from edges of flow items instead of from action area.")
            }

            SecondColumnLayout {
                CheckBox {
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.joinConnection__AUX
                    text: backendValues.enabled.valueToString
                }

                ExpandingSpacer {}
            }
        }
    }
}
