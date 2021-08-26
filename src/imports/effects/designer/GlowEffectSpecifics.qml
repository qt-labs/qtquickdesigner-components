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
        caption: qsTr("Glow Color")

        SectionLayout {
            PropertyLabel { text: qsTr("Glow color") }

            ColorEditor {
                backendValue: backendValues.color
                supportGradient: false
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Glow")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Radius")
                tooltip: qsTr("The softness of the glow. A larger radius causes the edges of the "
                              + "glow to appear more blurry. Depending on the radius value, value "
                              + "of the samples should be set to sufficiently large to ensure the "
                              + "visual quality.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.radius
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 100
                    stepSize: 1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Samples")
                tooltip: qsTr("Samples per pixel for edge softening blur calculation. A larger "
                              + "value produces better quality, but is slower to render. Ideally, "
                              + "this value should be twice as large as the highest required "
                              + "radius value plus one.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.samples
                    decimals: 1
                    minimumValue: 0
                    maximumValue: 201
                    stepSize: 1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Spread")
                tooltip: qsTr("The part of the glow color that is strengthened near the source "
                              + "edges.")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.spread
                    decimals: 2
                    minimumValue: 0
                    maximumValue: 1
                    stepSize: 0.1
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Caching and Border")

        SectionLayout {
            PropertyLabel {
                text: qsTr("Cached")
                tooltip: qsTr("Caches the effect output pixels to improve the rendering "
                              + "performance.")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.cached
                    text: backendValues.cached.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Transparent border")
                tooltip: qsTr("Pads the exterior of the component with a transparent edge, making "
                              + "sampling outside the source texture use transparency instead of "
                              + "the edge pixels.")
            }

            SecondColumnLayout {
                CheckBox {
                    backendValue: backendValues.transparentBorder
                    text: backendValues.transparentBorder.valueToString
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }
}
