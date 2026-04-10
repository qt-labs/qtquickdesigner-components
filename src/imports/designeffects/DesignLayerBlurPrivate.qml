// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    id: root

    property real radius: 10

    required property Item source

    readonly property real radiusCeiled: Math.ceil(root.radius)

    readonly property size textureSize: Qt.size(root.width + root.radiusCeiled * 2,
                                                root.height + root.radiusCeiled * 2)
    readonly property vector2d pixelSize: Qt.vector2d(1.0 / root.textureSize.width,
                                                      1.0 / root.textureSize.height)
    readonly property real sigma: root.radius / 2.7

    visible: true

    width: root.source?.width
    height: root.source?.height

    //Component.onCompleted: console.log("Layer Blur created!")

    ShaderEffectSource {
        id: shaderEffectSource
        visible: false
        width: root.width
        height: root.height
        sourceItem: root.source
        sourceRect: Qt.rect(-root.radiusCeiled, -root.radiusCeiled,
                            root.textureSize.width, root.textureSize.height)
    }

    ShaderEffect {
        id: blurHorizontal

        property real blurKernel: root.radius
        property real sigma: root.sigma
        property var src: shaderEffectSource
        property vector2d pixelSize: root.pixelSize.times(Qt.vector2d(1, 0))
        property bool useOffscreenColor: false
        property color offscreenColor: "transparent"

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
        property bool useOffscreenColor: false
        property color offscreenColor: "transparent"

        width: root.textureSize.width
        height: root.textureSize.height

        visible: true

        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }
}
