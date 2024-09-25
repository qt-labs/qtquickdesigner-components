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
import QtQuick.Shapes

/*!
    \qmltype RectangleItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A filled rectangle with an optional border.

    Rectangle items are used to fill areas with solid color or gradients and to provide a
    rectangular border.

    Each Rectangle item is painted using either a solid fill color, specified using the \l fillColor
    property, or a gradient, defined using one of the \l ShapeGradient subtypes and set using the
    \l gradient property. If both a color and a gradient are specified, the gradient is used.

    An optional border can be added to a rectangle with its own color and thickness by setting the
    \l strokeColor and \l strokeWidth properties. Setting the color to \c transparent creates a
    border without a fill color.

    Rounded rectangles can be drawn using the \l radius property. The radius can also be specified
    separately for each corner. Because this introduces curved edges to the corners of a rectangle.
    Additionally, \l bevel can be applied on any corner to cut it off sharply.

    \section2 Example Usage

    You can use the Rectangle component in \QDS to create different kinds of rectangles.

    \image studio-rectangle.webp

    The QML code looks as follows:

    \code
    RectangleItem {
        id: rectangle1
        x: 480
        y: 164
        width: 409
        height: 307
        radius: 0
        gradient: RadialGradient {
            GradientStop {
                position: 0
                color: "#cea1f9fc"
            }

            GradientStop {
                position: 1
                color: "#ec7d7d"
            }
            focalY: rectangle1.height * 0.5
            focalX: rectangle1.width * 0.5
            focalRadius: Math.min(rectangle1.width, rectangle1.height) * 0
            centerY: rectangle1.height * 0.5
            centerX: rectangle1.width * 0.5
            centerRadius: Math.min(rectangle1.width, rectangle1.height) * 0.5
        }
        strokeWidth: 6
        strokeColor: "#ff0000"
        bottomLeftRadius: 30
        topRightRadius: 30
        adjustBorderRadius: true
    }

    RectangleItem {
        id: rectangle2
        x: 954
        y: 164
        width: 409
        height: 307
        radius: 0
        fillColor: "#c062606a"
        strokeWidth: -1
        topRightRadius: 30
        strokeColor: "#8b8a8a"
        bottomLeftRadius: 30
        adjustBorderRadius: true
    }

    RectangleItem {
        id: rectangle3
        x: 480
        y: 533
        width: 409
        height: 307
        radius: 0
        gradient: LinearGradient {
            y2: rectangle3.height * 1
            y1: rectangle3.height * 0
            x2: rectangle3.width * 1
            x1: rectangle3.width * 0
            GradientStop {
                position: 0.10526
                color: "#e77979"
            }
            GradientStop {
                position: 0.67105
                color: "#716767"
            }
        }
        topRightBevel: true
        topRightRadius: 30
        strokeWidth: 6
        strokeColor: "#ff0000"
        bottomLeftRadius: 0
        adjustBorderRadius: true
    }

    RectangleItem {
        id: rectangle4
        x: 954
        y: 533
        width: 409
        height: 307
        radius: 30
        fillColor: "#d87c7c"
        borderMode: 2
        dashOffset: 3
        joinStyle: 2
        strokeStyle: 5
        topRightBevel: false
        strokeWidth: 6
        strokeColor: "#ff0000"
        adjustBorderRadius: true
    }
    \endcode
*/

Shape {
    id: root
    width: 200
    height: 150
/*!
    \include CommonItemDescriptions.qdocinc {component-radius} {10}

    If radius is non-zero, the corners will be rounded, otherwise they will be sharp. The radius can
    also be specified separately for each corner by using the \l bottomLeftRadius,
    \l bottomRightRadius, \l topLeftRadius, and \l topRightRadius properties.
*/
    property int radius: 10

/*!
    The radius of the top left rectangle corner.
*/
    property int topLeftRadius: root.radius

/*!
    The radius of the bottom left rectangle corner.
*/
    property int bottomLeftRadius: root.radius

/*!
    The radius of the top right rectangle corner.
*/
    property int topRightRadius: root.radius

/*!
    The radius of the bottom right rectangle corner.
*/
    property int bottomRightRadius: root.radius

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {rectangle}
*/
    property ShapeGradient gradient: null

/*!
    \include CommonItemDescriptions.qdocinc component-joinStyle
*/
    //property alias joinStyle: path.joinStyle
    property int joinStyle: ShapePath.MiterJoin //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc component-capStyle
*/
    //property alias capStyle: path.capStyle
    property int capStyle: ShapePath.SquareCap //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {rectangle}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {rectangle}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {rectangle}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {rectangle}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {rectangle}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {rectangle}
*/
    property alias dashOffset: path.dashOffset

/*!
    Whether the rectangle corner is beveled.
*/
    property bool bevel: false

/*!
    The bevel of the top left rectangle corner.

    \sa bevel
*/
    property bool topLeftBevel: root.bevel

/*!
    The bevel of the top right rectangle corner.

    \sa bevel
*/
    property bool topRightBevel: root.bevel

/*!
    The bevel of the bottom right rectangle corner.

    \sa bevel
*/
    property bool bottomRightBevel: root.bevel

/*!
    The bevel of the bottom left rectangle corner.

    \sa bevel
*/
    property bool bottomLeftBevel: root.bevel

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== undefined
    property bool __curveRendererActive: root.__preferredRendererTypeAvailable
                                         && root.rendererType === Shape.CurveRenderer

    layer.enabled: root.antialiasing && !root.__curveRendererActive
    layer.smooth: root.antialiasing && !root.__curveRendererActive
    layer.samples: root.antialiasing && !root.__curveRendererActive ? 4 : 0

/*!
    \include CommonItemDescriptions.qdocinc component-borderMode
*/
    property int borderMode: 0

    property real borderOffset: {
        if (root.borderMode === 0)
            return root.strokeWidth * 0.5
        if (root.borderMode === 1)
            return 0

        return -root.strokeWidth * 0.5
    }

/*!
    \include CommonItemDescriptions.qdocinc component-adjustBorderRadius
*/
    property bool adjustBorderRadius: false

    Item {
        anchors.fill: parent
        anchors.margins: {
            if (root.borderMode === 0)
                return 0
            if (root.borderMode === 1)
                return -root.strokeWidth * 0.5

            return -root.strokeWidth
        }
    }

    onRadiusChanged: Qt.callLater(root.calculateIndependentRadii)
    onTopLeftRadiusChanged: Qt.callLater(root.calculateIndependentRadii)
    onTopRightRadiusChanged: Qt.callLater(root.calculateIndependentRadii)
    onBottomLeftRadiusChanged: Qt.callLater(root.calculateIndependentRadii)
    onBottomRightRadiusChanged: Qt.callLater(root.calculateIndependentRadii)
    onWidthChanged: Qt.callLater(root.calculateIndependentRadii)
    onHeightChanged: Qt.callLater(root.calculateIndependentRadii)

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer

        root.calculateIndependentRadii()
    }

    function calculateIndependentRadii() {
        let minDimension = Math.min(root.width, root.height)
        let maxRadius = Math.floor(minDimension / 2)
        let mixed = !(root.radius === root.topLeftRadius
                   && root.radius === root.topRightRadius
                   && root.radius === root.bottomLeftRadius
                   && root.radius === root.bottomRightRadius)

        // Uniform radii
        if (!mixed) {
            path.__topLeftRadius = Math.min(root.topLeftRadius, maxRadius)
            path.__topRightRadius = Math.min(root.topRightRadius, maxRadius)
            path.__bottomRightRadius = Math.min(root.bottomRightRadius, maxRadius)
            path.__bottomLeftRadius = Math.min(root.bottomLeftRadius, maxRadius)
            return
        }

        // Mixed radii
        let topLeftRadiusMin = Math.min(minDimension, root.topLeftRadius)
        let topRightRadiusMin = Math.min(minDimension, root.topRightRadius)
        let bottomLeftRadiusMin = Math.min(minDimension, root.bottomLeftRadius)
        let bottomRightRadiusMin = Math.min(minDimension, root.bottomRightRadius)

        // Top radii
        let topRadii = root.topLeftRadius + root.topRightRadius

        if (topRadii > root.width) {
            let topLeftRadiusFactor = root.topLeftRadius / topRadii
            let tlr = Math.round(root.width * topLeftRadiusFactor)

            topLeftRadiusMin = Math.min(topLeftRadiusMin, tlr)
            topRightRadiusMin = Math.min(topRightRadiusMin, root.width - tlr)
        }

        // Right radii
        let rightRadii = root.topRightRadius + root.bottomRightRadius

        if (rightRadii > root.height) {
            let topRightRadiusFactor = root.topRightRadius / rightRadii
            let trr = Math.round(root.height * topRightRadiusFactor)

            topRightRadiusMin = Math.min(topRightRadiusMin, trr)
            bottomRightRadiusMin = Math.min(bottomRightRadiusMin, root.height - trr)
        }

        // Bottom radii
        let bottomRadii = root.bottomRightRadius + root.bottomLeftRadius

        if (bottomRadii > root.width) {
            let bottomRightRadiusFactor = root.bottomRightRadius / bottomRadii
            let brr = Math.round(root.width * bottomRightRadiusFactor)

            bottomRightRadiusMin = Math.min(bottomRightRadiusMin, brr)
            bottomLeftRadiusMin = Math.min(bottomLeftRadiusMin, root.width - brr)
        }

        // Left radii
        let leftRadii = root.bottomLeftRadius + root.topLeftRadius

        if (leftRadii > root.height) {
            let bottomLeftRadiusFactor = root.bottomLeftRadius / leftRadii
            let blr = Math.round(root.height * bottomLeftRadiusFactor)

            bottomLeftRadiusMin = Math.min(bottomLeftRadiusMin, blr)
            topLeftRadiusMin = Math.min(topLeftRadiusMin, root.height - blr)
        }

        path.__topLeftRadius = topLeftRadiusMin
        path.__topRightRadius = topRightRadiusMin
        path.__bottomLeftRadius = bottomLeftRadiusMin
        path.__bottomRightRadius = bottomRightRadiusMin
    }

    ShapePath {
        id: path

        property int __topLeftRadius: 0
        property int __topRightRadius: 0
        property int __bottomRightRadius: 0
        property int __bottomLeftRadius: 0

        readonly property real __borderRadiusAdjustment: {
            if (root.adjustBorderRadius) {
                if (root.borderMode === 1)
                    return (root.strokeWidth * 0.5)
                if (root.borderMode === 2)
                    return root.strokeWidth
            }
            return 0
        }

        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle

        strokeWidth: 4
        strokeColor: "red"
        fillGradient: root.gradient

        startX: path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment
        startY: root.borderOffset

        // Top.
        PathLine {
            x: root.width - path.__topRightRadius - root.borderOffset - path.__borderRadiusAdjustment
            y: root.borderOffset
        }

        // Top-right.
        PathArc {
            x: root.width - root.borderOffset
            y: path.__topRightRadius + root.borderOffset + path.__borderRadiusAdjustment

            radiusX: root.topRightBevel ? 50000 : path.__topRightRadius + path.__borderRadiusAdjustment
            radiusY: root.topRightBevel ? 50000 : path.__topRightRadius + path.__borderRadiusAdjustment
        }

        // Right.
        PathLine {
            x: root.width - root.borderOffset
            y: root.height - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment
        }

        // Bottom-right.
        PathArc {
            x: root.width - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment
            y: root.height - root.borderOffset

            radiusX: root.bottomRightBevel ? 50000 : path.__bottomRightRadius + path.__borderRadiusAdjustment
            radiusY: root.bottomRightBevel ? 50000 : path.__bottomRightRadius + path.__borderRadiusAdjustment
        }

        // Bottom.
        PathLine {
            x: path.__bottomLeftRadius + root.borderOffset + path.__borderRadiusAdjustment
            y: root.height - root.borderOffset
        }

        // Bottom-left.
        PathArc {
            x: root.borderOffset
            y: root.height - path.__bottomLeftRadius - root.borderOffset - path.__borderRadiusAdjustment

            radiusX: root.bottomLeftBevel ? 50000 : path.__bottomLeftRadius + path.__borderRadiusAdjustment
            radiusY: root.bottomLeftBevel ? 50000 : path.__bottomLeftRadius + path.__borderRadiusAdjustment
        }

        // Left.
        PathLine {
            x: root.borderOffset
            y: path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment
        }

        // Top-left.
        PathArc {
            x: path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment
            y: root.borderOffset

            radiusX: root.topLeftBevel ? 50000 : path.__topLeftRadius + path.__borderRadiusAdjustment
            radiusY: root.topLeftBevel ? 50000 : path.__topLeftRadius + path.__borderRadiusAdjustment
        }
    }
}
