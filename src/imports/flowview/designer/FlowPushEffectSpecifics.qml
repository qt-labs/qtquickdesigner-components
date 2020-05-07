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
import StudioTheme 1.0 as StudioTheme

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    FlowEffectSection {

    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Move Effect")

        SectionLayout {
            rows: 5
            columns: 2

            Label {
                text: qsTr("Direction")
                tooltip: qsTr("Sets the direction of the effect")
            }

            SecondColumnLayout {
                ComboBox {
                    useInteger: true
                    backendValue: backendValues.direction
                    implicitWidth: 180
                    model:  ["FromLeft", "FromRight", "FromBottom", "FromTop"]
                }
                ExpandingSpacer {

                }
            }

            Label {
                text: qsTr("Scale")
                tooltip: qsTr("Adds a scaling to the effect.")
            }
            SpinBox {
                backendValue: backendValues.scale
                maximumValue: 2
                minimumValue: 0.01
                hasSlider: true
                decimals: 2
                stepSize: 0.1
            }

            Label {
                text: qsTr("Incoming Opacity")
                tooltip: qsTr("Adds opacity to the effect.")
            }
            SpinBox {
                backendValue: backendValues.inOpacity
                maximumValue: 1
                minimumValue: 0
                hasSlider: true
                decimals: 2
                stepSize: 0.1
            }

            Label {
                text: qsTr("Outgoing Opacity")
                tooltip: qsTr("Adds opacity to the effect.")
            }
            SpinBox {
                backendValue: backendValues.outOpacity
                maximumValue: 1
                minimumValue: 0
                hasSlider: true
                decimals: 2
                stepSize: 0.1
            }

            Label {
                text: qsTr("Reveal")
                tooltip: qsTr("Reveals the incoming page.")
            }
            CheckBox {
                backendValue: backendValues.revealCurrent
            }
        }
    }
}
