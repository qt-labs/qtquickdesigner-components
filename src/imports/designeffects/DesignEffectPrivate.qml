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
import Qt.labs.qmlmodels

Item {
    id: root

    required property Item source

    property list<QtObject> effects

    property Item background: null

    property bool layerBlurVisible: true
    property real layerBlurRadius: 0
    property bool backgroundBlurVisible: true
    property real backgroundBlurRadius: 0

    onSourceChanged: root.source.antialiasing = false // Workaround

    width: root.source.width
    height: root.source.height

    Component.onCompleted: root.calculateBoundingBox()

    function clamp(input: real, min: real, max: real): real {

        if (isNaN(input))
            return 0

        return Math.max(min, Math.min(input, max))
    }

    property rect effectBoundingBox: Qt.rect(0, 0, 0, 0)

    function calculateBoundingBox() {
        let x = 0
        let y = 0
        let width = root.width
        let height = root.height

        for (let i = 0; i < repeater.count; ++i) {
            let item = repeater.itemAt(i)
            if (item === null || !(item instanceof DesignDropShadowPrivate))
                continue

            let childRect = item.boundingBox

            x = Math.min(x, childRect.x)
            y = Math.min(y, childRect.y)
            width = Math.max(width, childRect.width)
            height = Math.max(height, childRect.height)

            width += Math.max(0, -x) // TODO Understand
            height += Math.max(0, -y)
        }

        root.effectBoundingBox = Qt.rect(x, y, width, height)
    }

    DesignLayerBlurPrivate {
        id: layerBlur
        visible: root.layerBlurVisible
        radius: root.clamp(root.layerBlurRadius, 0, 250)

        source: layerBlurSource

        x: root.effectBoundingBox.x - Math.ceil(layerBlur.radius)
        y: root.effectBoundingBox.y - Math.ceil(layerBlur.radius)
    }

    ShaderEffectSource {
        id: layerBlurSource
        visible: false
        width: root.effectBoundingBox.width
        height: root.effectBoundingBox.height
        sourceItem: wrapper
        sourceRect: root.effectBoundingBox
        hideSource: root.layerBlurVisible

        //samples: 4 // Workaround
        //smooth: true
    }

    Item {
        id: wrapper
        anchors.fill: parent

        DesignBackgroundBlurPrivate {
            visible: root.backgroundBlurVisible
                     && root.background !== null
                     && root.backgroundBlurRadius !== 0

            source: root.source

            background: root.background
            radius: root.clamp(root.backgroundBlurRadius, 0, 250)
        }

        ShaderEffectSource {
            id: shaderEffectSource
            visible: true
            width: root.width
            height: root.height
            sourceItem: root.source
            hideSource: true
            z: 1
            //samples: 4 // Workaround
        }

        Repeater {
            id: repeater
            model: root.effects

            delegate: DelegateChooser {
                role: "type"

                DelegateChoice {
                    roleValue: "DropShadow"
                    DesignDropShadowPrivate {
                        required property var modelData

                        source: root.source

                        horizontalOffset: root.clamp(modelData.offsetX, -0xffff, 0xffff)
                        verticalOffset: root.clamp(modelData.offsetY, -0xffff, 0xffff)
                        spread: root.clamp(modelData.spread, -2048, 2048)
                        color: modelData.color
                        radius: root.clamp(modelData.blur, 0, 250)
                        showBehind: modelData.showBehind
                        visible: modelData.visible

                        onGeometryChanged: root.calculateBoundingBox()
                    }
                }

                DelegateChoice {
                    roleValue: "InnerShadow"
                    DesignInnerShadowPrivate {
                        required property var modelData

                        source: root.source

                        horizontalOffset: root.clamp(modelData.offsetX, -0xffff, 0xffff)
                        verticalOffset: root.clamp(modelData.offsetY, -0xffff, 0xffff)
                        spread: root.clamp(modelData.spread, -2048, 2048)
                        color: modelData.color
                        radius: root.clamp(modelData.blur, 0, 250)
                        visible: modelData.visible

                        z: 10
                    }
                }
            }
        }
    }
}
