/****************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Ultralite compatibility.
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

        caption: qsTr("Animated Sprite Directory")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Current frame")
                tooltip: qsTr("Set this property to advance the current frame")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.currentFrame
                    minimumValue: 0
                    maximumValue: Number.MAX_VALUE
                    decimals: 0
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Frame duration")
                tooltip: qsTr("Duration of each frame of the animation in milliseconds")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.frameDuration
                    minimumValue: 0
                    maximumValue: Number.MAX_VALUE
                    decimals: 0
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Loops")
                tooltip: qsTr("Indicate the number of times the animation should reply, set to -1 for Infinite")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.loops
                    minimumValue: -1
                    maximumValue: Number.MAX_VALUE
                    decimals: 0
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                    enabled: backendValue.isAvailable
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Running")
                tooltip: qsTr("Indicates whether the application is running or not")
            }

            SecondColumnLayout {
                CheckBox {
                    enabled: backendValues.running
                    text: backendValues.running.valueToString
                    backendValue: backendValues.running
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Paused")
                tooltip: qsTr("Indicate whether the animation is paused or not")
            }

            SecondColumnLayout {
                CheckBox {
                    enabled: backendValues.paused
                    text: backendValues.paused.valueToString
                    backendValue: backendValues.paused
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
            PropertyLabel {
                text: qsTr("Source path")
                tooltip: qsTr("Path to the directory with images for the sprite animation")
            }

            SecondColumnLayout {

                // QDS-11080: use UrlChooser instead when it supports folder selection
                LineEdit {
                    backendValue: backendValues.sourcePath
                    showTranslateCheckBox: false
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

        }
    }
}
