/****************************************************************************
**
** Copyright (C) 2024 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

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

