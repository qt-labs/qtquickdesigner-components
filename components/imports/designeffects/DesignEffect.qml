// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    id: root

    // Use visible property to show and hide the effect.
    visible: true

    // This is an internal property used to manage the effect. Do not modify.
    property Item __oldParent: null

    // This is the main source for the effect. Set internally to the current parent item. Do not modify.
    property Item source: null

    property list<QtObject> effects

    property bool layerBlurVisible: true
    property real layerBlurRadius: 0
    property bool backgroundBlurVisible: true
    property real backgroundBlurRadius: 0

    property Item backgroundLayer: null

    property bool _isEffectItem: true

    onParentChanged: {
        if (root.__oldParent && root.__oldParent !== root.parent) {
            root.__oldParent.layer.enabled = false
            root.__oldParent.layer.effect = null
            root.source = null
            root.__oldParent.update()
            root.__oldParent = null
        }

        if (root.parent) {
            root.__oldParent = root.parent
            if (root.visible) {
                root.parent.layer.enabled = true
                root.parent.layer.effect = effectComponent
            }
            root.source = root.parent
        }
    }

    onVisibleChanged: {
        if (root.parent == null)
            return

        if (root.visible) {
            root.source = root.parent
            root.parent.layer.enabled = true
            root.parent.layer.effect = effectComponent
        } else {
            root.parent.layer.enabled = false
            root.parent.layer.effect = null
            root.source = null
        }
        root.parent.update()
    }

    Component {
        id: effectComponent

        DesignEffectPrivate {
            id: effect
            property bool __effect: true
            source: root.source

            effects: root.effects
            layerBlurVisible: root.layerBlurVisible
            layerBlurRadius: root.layerBlurRadius
            backgroundBlurVisible: root.backgroundBlurVisible
            backgroundBlurRadius: root.backgroundBlurRadius
            background: root.backgroundLayer
        }
    }
}

