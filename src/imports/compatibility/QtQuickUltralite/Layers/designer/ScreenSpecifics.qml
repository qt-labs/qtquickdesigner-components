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

//! [Screen compatibility]
Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Screen")

        Label {
            text: qsTr("Output Device")
        }

        SecondColumnLayout {
            LineEdit {
                backendValue: backendValues.outputDevice
                Layout.fillWidth: true
                showTranslateCheckBox: false
            }

            ExpandingSpacer {
            }
        }
    }

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("Background Color")

        ColorEditor {
            caption: qsTr("Background Color")
            backendValue: backendValues.backgroundColor
            supportGradient: false
        }
    }
}
//! [Screen compatibility]