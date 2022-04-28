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
import StudioControls 1.0 as StudioControls

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("SVG Path Item")

        SectionLayout {
            PropertyLabel { text: qsTr("Fill color") }

            ColorEditor {
                backendValue: backendValues.fillColor
                supportGradient: true
                shapeGradients: true
            }

            PropertyLabel { text: qsTr("Stroke color") }

            ColorEditor {
                backendValue: backendValues.strokeColor
                supportGradient: false
            }

            PropertyLabel { text: qsTr("Stroke width") }

            SecondColumnLayout {
                SpinBox {
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

                StudioControls.CheckBox {
                    id: strokeWidthCheck
                    text: qsTr("Hide")
                    checked: backendValues.strokeWidth.value < 0
                    actionIndicator.visible: false
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth

                    onClicked: backendValues.strokeWidth.value = strokeWidthCheck.checked ? -1 : 4
                }

                ExpandingSpacer {}
            }
        }
    }

    StrokeDetailsSection {
        showJoinStyle: true
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Path Info")

        SectionLayout {
            PropertyLabel { text: qsTr("Path data") }

            SecondColumnLayout{
                LineEdit {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                    backendValue: backendValues.path
                    showTranslateCheckBox: false
                }

                ExpandingSpacer {}
            }
        }
    }
}
