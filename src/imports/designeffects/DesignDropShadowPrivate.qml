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

    property bool showBehind: false

    required property Item source

    readonly property real sourceRotation: root.source.rotation
    readonly property real radiusCeiled: Math.ceil(root.radius)

    readonly property size orginialTextureSize: Qt.size(root.width + root.spread * 2,
                                                        root.height + root.spread * 2)
    readonly property real sigma: root.radius / 2.7

    visible: true

    width: root.source.width
    height: root.source.height

    //Component.onCompleted: console.log("Drop Shadow created!")

    onSourceRotationChanged: root.calculateOffset()
    onRadiusCeiledChanged: root.calculateOffset()
    onSpreadChanged: root.calculateOffset()
    onHorizontalOffsetChanged: root.calculateOffset()
    onVerticalOffsetChanged: root.calculateOffset()

    signal geometryChanged()

    property point __offset: Qt.point(0, 0)

    function calculateOffset() {
        let mat = Qt.matrix4x4()
        mat.translate(Qt.vector3d(-root.spread, -root.spread, 0))
        mat.translate(Qt.vector3d(-root.radiusCeiled, -root.radiusCeiled, 0))
        mat.rotate(-root.sourceRotation, Qt.vector3d(0, 0, 1))
        root.__offset = mat.map(Qt.point(root.horizontalOffset, root.verticalOffset))
        root.__offset = Qt.point(Math.round(root.__offset.x), Math.round(root.__offset.y))

        root.geometryChanged()
    }

    readonly property bool copyActive: root.source instanceof Rectangle && root.spread !== 0

    Rectangle {
        id: sourceCopy
        visible: false
        width: Math.max(0, root.source.width + root.spread * 2)
        height: Math.max(0, root.source.height + root.spread * 2)
        radius: Math.max(0, root.source.radius !== 0 ? root.source.radius + root.spread : 0)
        color: "black"
    }

    ShaderEffectSource {
        id: shaderEffectSource
        visible: false
        width: root.orginialTextureSize.width
        height: root.orginialTextureSize.height
        sourceItem: root.copyActive ? sourceCopy : root.source
    }

    ShaderEffect {
        id: shadow

        property color color: root.color
        property var src: shaderEffectSource

        visible: false

        width: root.orginialTextureSize.width
        height: root.orginialTextureSize.height

        layer.enabled: true
        layer.sourceRect: Qt.rect(-root.radiusCeiled, -root.radiusCeiled,
                                  root.bluredTextureSize.width, root.bluredTextureSize.height)

        fragmentShader: "shaders/dropShadow.frag.qsb"
    }

    readonly property size bluredTextureSize: Qt.size(root.orginialTextureSize.width + root.radiusCeiled * 2,
                                                      root.orginialTextureSize.height + root.radiusCeiled * 2)

    readonly property vector2d bluredPixelSize: Qt.vector2d(1.0 / root.bluredTextureSize.width,
                                                            1.0 / root.bluredTextureSize.height)

    ShaderEffect {
        id: blurHorizontal

        property real blurKernel: root.radius
        property real sigma: root.sigma
        property var src: shadow
        property vector2d pixelSize: root.bluredPixelSize.times(Qt.vector2d(1, 0))
        property bool useOffscreenColor: false
        property color offscreenColor: "transparent"

        visible: false

        width: root.bluredTextureSize.width
        height: root.bluredTextureSize.height

        layer.enabled: true
        layer.smooth: true // Otherwise bluring artifacts

        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }

    ShaderEffect {
        id: blurVertical

        property real blurKernel: root.radius
        property real sigma: root.sigma
        property var src: blurHorizontal
        property vector2d pixelSize: root.bluredPixelSize.times(Qt.vector2d(0, 1))
        property bool useOffscreenColor: false
        property color offscreenColor: "transparent"

        visible: root.showBehind

        x: root.showBehind ? root.__offset.x : 0
        y: root.showBehind ? root.__offset.y : 0

        width: root.bluredTextureSize.width
        height: root.bluredTextureSize.height

        layer.enabled: !root.showBehind
        layer.sourceRect: Qt.rect(Math.min(0, -root.__offset.x),
                                  Math.min(0, -root.__offset.y),
                                  root.offsetTextureSize.width,
                                  root.offsetTextureSize.height)

        fragmentShader: "shaders/gaussianBlur.frag.qsb"
    }

    readonly property size offsetTextureSize: Qt.size(root.bluredTextureSize.width + Math.abs(root.__offset.x),
                                                      root.bluredTextureSize.height + Math.abs(root.__offset.y))

    ShaderEffectSource {
        id: originalSource
        visible: false
        width: root.offsetTextureSize.width
        height: root.offsetTextureSize.height
        sourceItem: root.source
        sourceRect: Qt.rect(Math.min(0, root.__offset.x),
                            Math.min(0, root.__offset.y),
                            root.offsetTextureSize.width,
                            root.offsetTextureSize.height)
    }

    ShaderEffect {
        id: result
        property var shadow: blurVertical
        property var original: originalSource

        visible: !root.showBehind

        x: -Math.max(0, -root.__offset.x)
        y: -Math.max(0, -root.__offset.y)
        width: root.offsetTextureSize.width
        height: root.offsetTextureSize.height

        fragmentShader: "shaders/dropShadowClip.frag.qsb"
    }

    readonly property rect boundingBox: Qt.rect(result.x, result.y, result.width, result.height)

    onBoundingBoxChanged: root.geometryChanged()
}
