// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 
import QtQuick.Layouts
import HelperWidgets
import StudioTheme

//! [QulPerfOverlay compatibility]
Column {
    anchors.left: parent.left
    anchors.right: parent.right

    Section {
        anchors.left: parent.left
        anchors.right: parent.right
        caption: qsTr("QulPerf Overlay")
    }

}
//! [QulPerfOverlay compatibility]
