// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root

    property list<FlowItem> positivelist
    property list<FlowItem> negativelist

    default property list<QtObject> data

    property FlowTransition target

    property var transitionView: Item {}

    property bool globalWildcard: false

    function trigger() {
        var cItem = root.transitionView.currentItem

        if (root.globalWildcard && root.transitionView.parentFlowView()) {
            root.transitionView.__parentFlowChanged = true
            root.transitionView.parentFlowView().gotoItem(root.transitionView.parentFlowItem())
        }

        if (cItem === undefined)
            return

        if (root.transitionView.checkInclude(root.negativelist, cItem))
            return;

        if (root.positivelist.length !== 0) {
            if (!root.transitionView.checkInclude(root.positivelist, cItem))
                return;
        }

        root.target.trigger()
    }

    property EventListener eventListener: EventListener {
        id: eventListener
        onTriggered: root.trigger()
    }

    property alias eventIds: eventListener.eventIds
}


