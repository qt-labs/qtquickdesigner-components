// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root

    signal finished

    /* Those should be lists that allow a n*n mappings. */
    //property Item from: null
    //property Item to: null
    property list<QtObject> from
    property list<QtObject> to
    property int duration

    property var transitionView: Item {}

    property real progress: effect.progress

    property bool condition: true

    property string question

    function __start() {
        root.effect.start()
    }

    function __enable() {
        effect.enable()
    }

    function __reset(current, next) {
        root.effect.from = current
        root.effect.to = next
        root.effect.transitionView = root.transitionView

        root.effect.reset()
    }

    function __stop(current, next) {
        root.effect.stop()
    }

    function __checkInclude(list, item) {
        for (var i = 0; i < list.length; ++i) {
            if (list[i] === item)
                return true
        }
        return false
    }

    property alias eventIds: eventListener.eventIds

    function __receiveEvent(parameters) {
        var flowItem = root.from[0]
        var flow = root.transitionView

        if (flowItem.stateChangeTarget !== undefined
                && flowItem.stateChangeTarget === flow.currentItem) {
            if (flowItem.targetState === flow.currentItem.state)
                flowItem = flowItem.stateChangeTarget
        }

        if (flow.currentItem !== flowItem)
            return;

        root.trigger()
    }

    property EventListener eventListener: EventListener {
        id: eventListener
        onTriggered: root.__receiveEvent(parameters)
    }

    function trigger() {
        var fromEmpty = root.from.length === 0

        if (to[0].isFlowDecision === true)
            to[0].trigger();

        var stateChanger = false

        if (root.from[0] !== undefined)
            stateChanger = root.from[0].stateChangeTarget !== undefined

        var toStateChanger = false

        if (root.to[0] !== undefined)
            toStateChanger = root.to[0].stateChangeTarget !== undefined

        if (!toStateChanger && root.to[0].defaultState !== undefined)
            root.to[0].state = root.to[0].defaultState

        if (stateChanger || fromEmpty || __checkInclude(root.from, transitionView.currentItem))
            timer.restart()
    }

    function __decisionTrigger() {
        /* Workaround for flowDecisions with multiple sources */
        if (!__checkInclude(root.from, transitionView.currentItem) && root.from.length !== 0)
            root.from = []
        root.trigger()
    }

    property Timer timer: Timer {
        interval: 1
        running: false
        repeat: false
        onTriggered: transitionView.gotoPage(root)
    }

    property FlowEffect effect: DefaultFlowEffect {
        transitionView: transitionView

    }

    onEffectChanged: {
        root.effect.transitionView = root.transitionView
    }

    property Connections effectConnection: Connections {
        target: root.effect
        function onFinished() { root.finished() }
    }
}
