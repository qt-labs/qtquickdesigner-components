// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

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
