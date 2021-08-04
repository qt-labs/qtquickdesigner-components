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

import QtQuick 2.0
import HelperWidgets 2.0
import QtQuick.Layouts 1.0

Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Displace")

        SectionLayout {
            rows: 2
            Label {
                text: qsTr("Displacement")
                toolTip: qsTr("The scale for the displacement. The bigger the scale, the bigger "
                              + "the displacement of the pixels.")
            }
            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.displacement
                    Layout.preferredWidth: 80
                    decimals: 2
                    minimumValue: -1
                    maximumValue: 1
                    stepSize: 0.1
                }
                ExpandingSpacer {
                }
            }

            Label {
                text: qsTr("Displacement source")
                toolTip: qsTr("The item that is going to be used as the displacement map.")
            }
            SecondColumnLayout {
                ItemFilterComboBox {
                    typeFilter: "QtQuick.Item"
                    validator: RegExpValidator { regExp: /(^$|^[a-z_]\w*)/ }
                    backendValue: backendValues.displacementSource
                    Layout.fillWidth: true
                }
                ExpandingSpacer {
                }
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Caching")

        SectionLayout {
            rows: 2
            Label {
                text: qsTr("Cached")
                toolTip: qsTr("Caches the effect output pixels to improve the rendering "
                              + "performance.")
            }
            SecondColumnLayout {
                CheckBox {
                    Layout.fillWidth: true
                    backendValue: backendValues.cached
                    text: backendValues.cached.valueToString
                }
                ExpandingSpacer {
                }
            }
        }
    }
}