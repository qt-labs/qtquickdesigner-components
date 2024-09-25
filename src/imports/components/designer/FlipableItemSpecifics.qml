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
import StudioControls 1.0 as StudioControls
import StudioTheme 1.0 as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        caption: qsTr("Flipped Status")

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel {
                text: qsTr("Rotational axis")
                tooltip: qsTr("Sets the rotation along with the x-axis or y-axis.")
            }

            SecondColumnLayout {
                ComboBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    width: implicitWidth
                    backendValue: backendValues.rotationalAxis
                    model: ["X Axis", "Y Axis"]
                    useInteger: true
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Flip angle")
                tooltip: qsTr("Sets the angle of the components to produce the flipping effect.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.flipAngle
                    minimumValue: -360
                    maximumValue: 360
                    stepSize: 10
                    sliderIndicatorVisible: true
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel { text: "°" }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Opacity")

        anchors.left: parent.left
        anchors.right: parent.right

        SectionLayout {
            PropertyLabel {
                text: qsTr("Front")
                tooltip: qsTr("Sets the visibility percentage of the front side component within the Flipable component.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.opacityFront // TODO convert to %
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                    sliderIndicatorVisible: true
                }

                // Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                // ControlLabel { text: "%" }

                ExpandingSpacer {}
            }
            PropertyLabel {
                text: qsTr("Back")
                tooltip: qsTr("Sets the visibility percentage of the back side component within the Flipable component.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    backendValue: backendValues.opacityBack // TODO convert to %
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                    sliderIndicatorVisible: true
                }

                // Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                // ControlLabel { text: "%" }

                ExpandingSpacer {}
            }
        }
    }
}
