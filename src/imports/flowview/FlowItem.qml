// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

Item {
    id: flowItem

    width: 400
    height: 400

    property var flowView: Item {}

    property alias loaderSource: loader.source

    property var stateChangeTarget

    property string targetState

    property string defaultState: undefined

    property bool forceActive: false

    property bool __isFlowItem: true

    function setState(newState) {
        flowItem.state = newState
    }

    property bool active: {
        if (flowItem.forceActive)
            return true;
        if (flowItem.flowView !== null
                && flowItem.flowView.currentItem !== undefined
                && flowItem.flowView.currentItem === flowItem)
            return true

        if (flowItem.flowView !== null
                && flowItem.flowView.nextItem !== undefined
                && flowItem.flowView.nextItem === flowItem)
            return true

        return false
    }

    Loader {
        id: loader
        active: flowItem.active
    }


    function init() {

        flowItem.x = 0
        flowItem.y = 0

        flowItem.defaultState = flowItem.state
        var itemVar
        var i

        if (flowItem.stateChangeTarget === undefined) {

            for (i = 0; i < flowItem.children.length; ++i) {
                itemVar = flowItem.children[i]
                if (itemVar.isActionArea === true
                        && !itemVar.fromStateChange) {
                    itemVar.activeState = flowItem.state
                }

            }
        } else {
            var childNum = flowItem.children.length
            var childArray = []

            for (i = 0; i < flowItem.children.length; ++i) {
                childArray.push(flowItem.children[i])
            }

            for (i = 0; i < childNum; ++i) {
                itemVar = childArray[i]

                if (itemVar.isActionArea === true) {
                    itemVar.fromStateChange = true
                    itemVar.activeState = flowItem.targetState
                    itemVar.parent = flowItem.stateChangeTarget
                }
            }
        }
    }
}
