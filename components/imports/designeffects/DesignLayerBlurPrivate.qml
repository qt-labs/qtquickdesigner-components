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
