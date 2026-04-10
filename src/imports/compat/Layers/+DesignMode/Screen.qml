// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15

//! [Screen compatibility]
Rectangle {
    id: wnd
    property string outputDevice: "device"
    property alias backgroundColor: wnd.color

    property real defaultApplicationWidth: 0
    property real defaultApplicationHeight: 0

    visible: true
}
//! [Screen compatibility]
