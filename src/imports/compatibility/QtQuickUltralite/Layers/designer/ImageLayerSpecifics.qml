/******************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Ultralite module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/
import QtQuick 2.15

import HelperWidgets 2.0
import QtQuick.Layouts 1.0

//! [ImageLayer compatibility]
Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Image Layer")

        SectionLayout {
            Label {
                text: qsTr("Platform ID")
            }

            SecondColumnLayout {
                SpinBox {
                    backendValue: backendValues.platformId
                    minimumValue: 0
                    maximumValue: 2000
                    decimals: 0
                }

                ExpandingSpacer {
                }
            }

            Label {
                text: qsTr("Rendering Hints")
            }

            SecondColumnLayout {
                ComboBox {
                    model: ["OptimizeForSpeed", "OptimizeForSize", "StaticContents"]
                    backendValue: backendValues.renderingHints
                    Layout.fillWidth: true
                    scope: "RenderingHints"
                }
            }

            Label {
                text: qsTr("Source")
            }

            SecondColumnLayout {
                UrlChooser {
                    Layout.fillWidth: true
                    backendValue: backendValues.source
                }

                ExpandingSpacer {
                }
            }
        }
    }
}
//! [ImageLayer compatibility]
