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
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Section {
    anchors.left: parent.left
    anchors.right: parent.right
    caption: qsTr("Corner Radiuses")

    SectionLayout {
        PropertyLabel {
            text: qsTr("Top")
            tooltip: qsTr("Toggles the top left or right corner to a rounded shape.")
        }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.topLeftRadius
                decimals: 1
                minimumValue: 0
                maximumValue: 0xffff
                stepSize: 1
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            MultiIconLabel {
                icon0: StudioTheme.Constants.cornerA
                icon1: StudioTheme.Constants.cornerB
            }

            Spacer { implicitWidth: StudioTheme.Values.controlGap }

            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.topRightRadius
                decimals: 1
                minimumValue: 0
                maximumValue: 0xffff
                stepSize: 1
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            MultiIconLabel {
                icon0: StudioTheme.Constants.cornerA
                icon1: StudioTheme.Constants.cornerB
                rotation: 90
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Bottom")
            tooltip: qsTr("Toggles the bottom left or right corner to a rounded shape.")
        }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.bottomLeftRadius
                decimals: 1
                minimumValue: 0
                maximumValue: 0xffff
                stepSize: 1
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            MultiIconLabel {
                icon0: StudioTheme.Constants.cornerA
                icon1: StudioTheme.Constants.cornerB
                rotation: 270
            }

            Spacer { implicitWidth: StudioTheme.Values.controlGap }

            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.bottomRightRadius
                decimals: 1
                minimumValue: 0
                maximumValue: 0xffff
                stepSize: 1
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            MultiIconLabel {
                icon0: StudioTheme.Constants.cornerA
                icon1: StudioTheme.Constants.cornerB
                rotation: 180
            }

            ExpandingSpacer {}
        }

        PropertyLabel {
            text: qsTr("Global")
            tooltip: qsTr("Toggles all the corners into a rounded shape.")
        }

        SecondColumnLayout {
            SpinBox {
                implicitWidth: StudioTheme.Values.twoControlColumnWidth
                               + StudioTheme.Values.actionIndicatorWidth
                backendValue: backendValues.radius
                decimals: 1
                minimumValue: 0
                maximumValue: 0xffff
                stepSize: 1
            }

            Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

            IconLabel {
                icon: StudioTheme.Constants.cornersAll
            }

            ExpandingSpacer {}
        }
    }
}
