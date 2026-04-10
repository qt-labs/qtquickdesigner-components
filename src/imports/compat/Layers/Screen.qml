// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Window 2.2

//! [Screen compatibility]
Item {
    id: root

    property string outputDevice: "device"
    property alias backgroundColor: wnd.color

    property real defaultApplicationWidth: 0
    property real defaultApplicationHeight: 0

    onChildrenChanged: {
        if (wnd.isAvailable)
            wnd.reparenting()
    }

    Window {
        id: wnd
        visible: true

        width: root.width
        height: root.height

        property bool reparentingBlock: false
        property bool isAvailable: false

        Component.onCompleted: {
            reparenting()
            isAvailable = true
        }

        function reparenting() {
            if (reparentingBlock)
                return;

            reparentingBlock = true;

            var result = [];
            var rootChildren = root.children;
            for (var i = 0; i < rootChildren.length; i++) {
                if (rootChildren[i] !== wnd) {
                    result.push(rootChildren[i]);
                }
            }
            wnd.data = result;

            reparentingBlock = false;
        }
    }
}
//! [Screen compatibility]
