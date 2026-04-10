// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    id: root

    property real radius: 10

    /*required*/ property Item source
    /*required*/ property Item background

    readonly property real sourceRotation: root.source.rotation

    readonly property size textureSize: Qt.size(root.targetRect.width,
                                                root.targetRect.height)
    readonly property vector2d pixelSize: Qt.vector2d(1.0 / root.textureSize.width,
                                                      1.0 / root.textureSize.height)
    readonly property real sigma: root.radius / 2.7

    visible: true

    width: root.source.width
    height: root.source.height

    rotation: -root.sourceRotation

    property rect targetRect: Qt.rect(0, 0, 0, 0)

    Connections {
        target: root.background
        function onXChanged() { root.sizeStuff() }
        function onYChanged() { root.sizeStuff() }
        function onWidthChanged() { root.sizeStuff() }
        function onHeightChanged() { root.sizeStuff() }
    }

    Connections {
        target: root.source

        function onXChanged() { root.sizeStuff() }
        function onYChanged() { root.sizeStuff() }
        function onWidthChanged() { root.sizeStuff() }
        function onHeightChanged() { root.sizeStuff() }
        function onRotationChanged() { root.sizeStuff() }
    }

    onSourceChanged: root.sizeStuff()
    onBackgroundChanged: root.sizeStuff()

    function sizeStuff() {
        if (root.background === null)
            return

        let tRect = Qt.rect(0, 0, root.source.width, root.source.height)
        root.targetRect = root.background.mapFromItem(root.source, tRect)
    }

    //Component.onCompleted: console.log("Background Blur created!")

    // TODO
    // Check if target and background overlap
    // Check if target is actually transparent

    ShaderEffectSource {
        id: shaderEffectSource
        visible: false
        width: root.width
        height: root.height
        sourceItem: root.background
        sourceRect: root.targetRect
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
        anchors.centerIn: parent

        layer.enabled: true
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

        visible: false

        width: root.textureSize.width
        height: root.textureSize.height
        anchors.centerIn: parent

        layer.enabled: true
        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }

    Item {
        id: wrapper
        anchors.centerIn: parent

        width: root.textureSize.width
        height: root.textureSize.height

        visible: false
        layer.enabled: true

        ShaderEffectSource {
            id: shaderEffectSource2
            visible: true
            anchors.centerIn: parent
            rotation: root.sourceRotation

            width: root.source.width
            height: root.source.height
            sourceItem: root.source
        }
    }

    ShaderEffect {
        id: mask

        property var source: blurVertical
        property var maskSource: wrapper

        visible: true

        width: root.textureSize.width
        height: root.textureSize.height

        anchors.centerIn: parent
        fragmentShader: "shaders/opacityMask.frag.qsb"
    }
}
