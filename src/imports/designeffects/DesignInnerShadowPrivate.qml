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

    property int horizontalOffset: 10
    property int verticalOffset: 30
    property int spread: 0
    property color color: "black"
    property real radius: 10

    required property Item source

    readonly property real sourceRotation: root.source.rotation

    readonly property size textureSize: Qt.size(Math.max(root.width, root.width - root.spread * 2) + Math.abs(root.__offset.x),
                                                Math.max(root.height, root.height - root.spread * 2) + Math.abs(root.__offset.y))
    readonly property vector2d pixelSize: Qt.vector2d(1.0 / root.textureSize.width,
                                                      1.0 / root.textureSize.height)
    readonly property real sigma: root.radius / 2.7

    visible: true

    width: root.source.width
    height: root.source.height

    //Component.onCompleted: console.log("Inner Shadow created!")

    onSourceRotationChanged: root.calculateOffset()
    onSpreadChanged: root.calculateOffset()
    onHorizontalOffsetChanged: root.calculateOffset()
    onVerticalOffsetChanged: root.calculateOffset()

    property point __offset: Qt.point(0, 0)

    function calculateOffset() {
        let mat = Qt.matrix4x4()
        mat.rotate(-root.sourceRotation, Qt.vector3d(0, 0, 1))
        root.__offset = mat.map(Qt.point(root.horizontalOffset, root.verticalOffset))
        root.__offset = Qt.point(Math.round(root.__offset.x), Math.round(root.__offset.y))
    }

    readonly property bool copyActive: root.source instanceof Rectangle && root.spread !== 0

    Rectangle {
        id: sourceCopy
        visible: false
        width: Math.max(0, root.source.width - root.spread * 2)
        height: Math.max(0, root.source.height - root.spread * 2)
        radius: Math.max(0, root.source.radius !== 0 ? root.source.radius - root.spread : 0)
        color: "black"
    }

    ShaderEffectSource {
        id: shaderEffectSource
        visible: false
        width: root.textureSize.width
        height: root.textureSize.height
        sourceItem: root.copyActive ? sourceCopy : root.source
        sourceRect: Qt.rect(Math.min(0, -root.__offset.x) - Math.max(0, root.spread),
                            Math.min(0, -root.__offset.y) - Math.max(0, root.spread),
                            root.textureSize.width,
                            root.textureSize.height)
    }

    ShaderEffect {
        id: shadow

        property color color: root.color
        property var src: shaderEffectSource

        visible: false

        width: root.textureSize.width
        height: root.textureSize.height

        layer.enabled: true

        fragmentShader: "shaders/innerShadow.frag.qsb"
    }

    ShaderEffect {
        id: blurHorizontal

        property real blurKernel: root.radius
        property real sigma: root.sigma
        property var src: shadow
        property vector2d pixelSize: root.pixelSize.times(Qt.vector2d(1, 0))
        property bool useOffscreenColor: true
        property color offscreenColor: root.color

        visible: false

        width: root.textureSize.width
        height: root.textureSize.height

        layer.enabled: true
        layer.smooth: true // Otherwise bluring artifacts

        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }

    ShaderEffect {
        id: blurVertical

        property real blurKernel: root.radius
        property real sigma: root.sigma
        property var src: blurHorizontal
        property vector2d pixelSize: root.pixelSize.times(Qt.vector2d(0, 1))
        property bool useOffscreenColor: true
        property color offscreenColor: root.color

        visible: false

        width: root.textureSize.width
        height: root.textureSize.height

        layer.enabled: true
        layer.smooth: true // Otherwise bluring artifacts

        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }

    ShaderEffectSource {
        id: originalSource
        visible: false
        hideSource: true
        width: root.textureSize.width
        height: root.textureSize.height
        sourceItem: root.source
        sourceRect: Qt.rect(Math.min(0, root.__offset.x) + Math.min(0, root.spread),
                            Math.min(0, root.__offset.y) + Math.min(0, root.spread),
                            root.textureSize.width,
                            root.textureSize.height)
    }

    ShaderEffect {
        property var shadow: blurVertical
        property var original: originalSource

        visible: true

        x: -Math.max(0, -root.__offset.x) + Math.min(0, root.spread)
        y: -Math.max(0, -root.__offset.y) + Math.min(0, root.spread)
        width: root.textureSize.width
        height: root.textureSize.height

        fragmentShader: "shaders/innerShadowClip.frag.qsb"
    }
}
