// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
import FlowView 1.0

Item {
    id: flowItem

    width: 400
    height: 400

    property var flowView: Item {}

    property string __designer_url__

    property alias loaderSource: loader.source

    property var stateChangeTarget

    property string defaultState

    clip: true

    function setState(state) {

    }

    onStateChangeTargetChanged: {
        loader.source = stateChangeTarget['__designer_url__']
        loader.item.state = flowItem.targetState
        flowItem.width = flowItem.stateChangeTarget.width
        flowItem.height = flowItem.stateChangeTarget.height
    }


    property string targetState

    onTargetStateChanged: {
        loader.active = false
        loader.active = true
        loader.item.state = flowItem.targetState
    }

    Text {
        text: flowItem.targetState
    }

    property bool active: false


    function init() {
        flowItem.defaultState = flowItem.state
        if (FlowState.loading)
            return

        if (loader.source == "")
            return

        FlowState.loading = true
        flowItem.active = true
    }

    Loader {
        id: loader
        active: flowItem.active
        onLoaded: {
            flowItem.width = loader.item.childrenRect.width
            flowItem.height = loader.item.childrenRect.height
            FlowState.loading = false
        }
    }
}
