// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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
