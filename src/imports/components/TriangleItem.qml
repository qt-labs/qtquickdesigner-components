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
    \qmltype Triangle
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A triangle.

    The Triangle type can be used to draw triangles with different dimensions and shapes. The type
    is enclosed in an invisible \l Rectangle type. The size of the triangle is determined by the
    size of the bounding rectangle. The dimensions of the triangle can be changed to make it
    elongated or squat with space around it by using the \l leftMargin, \l topMargin, \l rightMargin,
    and \l bottomMargin properties. The margins are set between the triangle and the edges of the
    parent rectangle.

    Each Triangle item is painted using either a solid fill color, specified using the \l fillColor
    property, or a gradient, defined using one of the \l ShapeGradient subtypes and set using the
    \l gradient property. If both a color and a gradient are specified, the gradient is used.

    An optional border can be added to a triangle with its own color and thickness by setting the
    \l strokeColor and \l strokeWidth properties. Setting the color to \c transparent creates a
    border without a fill color.

    \section2 Example Usage

    You can use the Triangle component in \QDS to create triangles in different shapes and colors.

    \image studio-triangle.webp

    The QML code looks as follows:

    \code
    TriangleItem {
        id: triangle
        x: 845
        y: 265
        strokeColor: "gray"
        fillColor: "light gray"
    }

    TriangleItem {
        id: squatTriangle
        x: 1009
        y: 265
        bottomMargin: 10
        topMargin: 30
        fillColor: "#d3d3d3"
        strokeColor: "#808080"
    }

    TriangleItem {
        id: elongatedTriangle
        x: 845
        y: 394
        rightMargin: 10
        leftMargin: 10
        fillColor: "#d3d3d3"
        strokeColor: "#808080"
    }

    TriangleItem {
        id: pear
        x: 1009
        y: 394
        radius: 20
        fillColor: "light gray"
        bottomMargin: 10
        arcRadius: 20
        strokeColor: "#808080"
    }
    \endcode
*/

Shape {
    id: root

    width: 100
    height: 100

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {triangle}
*/
    property alias gradient: path.fillGradient

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {triangle}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {triangle}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {triangle}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc component-joinStyle
*/
    //property alias joinStyle: path.joinStyle
    property int joinStyle: ShapePath.MiterJoin //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc component-capStyle
*/
    //property alias capStyle: path.capStyle
    property int capStyle: ShapePath.FlatCap //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {triangle}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {triangle}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {triangle}
*/
    property alias dashOffset: path.dashOffset

    property int pLineXStart
    property int pLineXEnd
    property int pLineYStart
    property int pLineYEnd

    property point topIntersection1
    property point topIntersection2
    property point leftIntersection1
    property point leftIntersection2
    property point rightIntersection1
    property point rightIntersection2

/*!
    \include CommonItemDescriptions.qdocinc {component-radius} {5}

    This property can be used together with the \l arcRadius property to determine the shape of the
    triangle.

    \sa arcRadius
*/
    property int radius: 5

/*!
    \include CommonItemDescriptions.qdocinc {component-radius} {5}

    This property can be used together with the \l radius property to
    determine the shape of the triangle.
*/
    property real arcRadius: root.radius

/*!
    The left margin between the triangle and the bounding rectangle.
    Setting the left and right margins makes the triangle thinner and moves it away from the edge.

    \sa rightMargin, topMargin, bottomMargin
*/
    property real leftMargin: 0

/*!
    The top margin between the triangle and the bounding rectangle.
    Setting the top and bottom margins makes the triangle lower and moves it away from the edge.

    \sa bottomMargin, leftMargin, rightMargin
*/
    property real topMargin: 0

/*!
    The right margin between the triangle and the bounding rectangle.
    Setting the left and right margins makes the triangle thinner and moves it away from the edge.

    \sa leftMargin, topMargin, bottomMargin
*/
    property real rightMargin: 0

/*!
    \qmlproperty real Triangle::bottomMargin

    The top margin between the triangle and the bounding rectangle.
    Setting the top and bottom margins makes the triangle shorter and moves it away from the edge.

    \sa topMargin, leftMargin, rightMargin
*/
    property real bottomMargin: 0

    property int maxRadius: 0

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== undefined
    property bool __curveRendererActive: root.__preferredRendererTypeAvailable
                                         && root.rendererType === Shape.CurveRenderer

    layer.enabled: root.antialiasing && !root.__curveRendererActive
    layer.smooth: root.antialiasing && !root.__curveRendererActive
    layer.samples: root.antialiasing && !root.__curveRendererActive ? 4 : 0

    // This is used to make the bounding box of the item a bit bigger so it will draw sharp edges
    // in case of large stroke width instead of cutting it off.
    Item {
        anchors.fill: parent
        anchors.margins: -root.strokeWidth
    }

    ShapePath {
        id: path

        //property real __width: root.width - root.strokeWidth - root.leftMargin - root.rightMargin
        //property real __height: root.height - root.strokeWidth - root.topMargin - root.bottomMargin
        //property real xOffset: root.strokeWidth / 2 + root.leftMargin
        //property real yOffset: root.strokeWidth / 2 + root.topMargin

        property real __width: root.width - root.leftMargin - root.rightMargin
        property real __height: root.height - root.topMargin - root.bottomMargin
        property real xOffset: root.leftMargin
        property real yOffset: root.topMargin

        strokeWidth: 4
        strokeColor: "red"
        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle

        startX: root.topIntersection1.x + path.xOffset
        startY: root.topIntersection1.y + path.yOffset

        PathArc {
            radiusX: Math.max(root.arcRadius, 1)
            radiusY: Math.max(root.arcRadius, 1)

            x: root.topIntersection2.x + path.xOffset
            y: root.topIntersection2.y + path.yOffset
        }

        PathLine {
            x: root.rightIntersection1.x + path.xOffset
            y: root.rightIntersection1.y + path.yOffset
        }

        PathArc {
            radiusX: Math.max(root.arcRadius, 1)
            radiusY: Math.max(root.arcRadius, 1)

            x: root.rightIntersection2.x + path.xOffset
            y: root.rightIntersection2.y + path.yOffset
        }

        PathLine {
            x: root.leftIntersection1.x + path.xOffset
            y: root.leftIntersection1.y + path.yOffset
        }

        PathArc {
            radiusX: Math.max(root.arcRadius, 1)
            radiusY: Math.max(root.arcRadius, 1)

            x: root.leftIntersection2.x + path.xOffset
            y: root.leftIntersection2.y + path.yOffset
        }

        PathLine {
            x: root.topIntersection1.x + path.xOffset
            y: root.topIntersection1.y + path.yOffset
        }
    }

    onWidthChanged: root.calc()
    onHeightChanged: root.calc()

    onRadiusChanged: root.calc()
    onArcRadiusChanged: root.calc()

    onTopMarginChanged: root.calc()
    onBottomMarginChanged: root.calc()
    onLeftMarginChanged: root.calc()
    onRightMarginChanged: root.calc()

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer

        root.calc()
    }

    function length(x, y) {
        return Math.sqrt(x * x + y * y)
    }

    function normalize(x, y) {
        var l = length(x, y)

        return {
            x: x / l,
            y: y / l
        }
    }

    function dotProduct(x1, y1, x2, y2) {
        return x1 * x2 + y1 * y2;
    }

    function project(x1, y1, x2, y2) {
        var normalized = normalize(x1, y1)

        var dot = dotProduct(normalized.x, normalized.y, x2, y2)

        return {
            x: normalized.x * dot,
            y: normalized.y * dot
        }
    }

    function intersect(x1, y1, x2, y2, x3, y3, x4, y4) {
        var denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1)

        var ua = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / denom
        var ub = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / denom
        return {
            x: x1 + ua * (x2 - x1),
            y: y1 + ua * (y2 - y1)
        };
    }

    function moveLine(startX, startY, endX, endY) {
        var angle = Math.atan2(endY - startY, endX - startX)
        var xOffset = Math.sin(angle) * Math.min(root.radius, root.maxRadius)
        var yOffset = -Math.cos(angle) * Math.min(root.radius, root.maxRadius)

        return {
            startX: startX + xOffset,
            startY: startY + yOffset,
            endX: endX + xOffset,
            endY: endY + yOffset
        };
    }

    function calc() {
        var movedLine1 = moveLine(path.__width / 2, 0, 0, path.__height)
        var movedLine2 = moveLine(path.__width, path.__height, path.__width / 2, 0)
        var movedLine3 = moveLine(0, path.__height, path.__width, path.__height)

        var lengthLine1 = Math.floor(root.length(movedLine1.endX - movedLine1.startX,
                                                 movedLine1.endY - movedLine1.startY))
        var lengthLine2 = Math.floor(root.length(movedLine2.endX - movedLine2.startX,
                                                 movedLine2.endY - movedLine2.startY))
        var lengthLine3 = Math.floor(root.length(movedLine3.endX - movedLine3.startX,
                                                 movedLine3.endY - movedLine3.startY))

        var perimeter = lengthLine1 + lengthLine2 + lengthLine3
        var area = (path.__height) * (path.__width) * 0.5

        root.maxRadius = area * 2 / perimeter

        var intersectionTop = root.intersect(movedLine1.startX, movedLine1.startY,
                                             movedLine1.endX, movedLine1.endY,
                                             movedLine2.startX, movedLine2.startY,
                                             movedLine2.endX, movedLine2.endY)
        var intersectionLeft = root.intersect(movedLine1.startX, movedLine1.startY,
                                              movedLine1.endX, movedLine1.endY,
                                              movedLine3.startX, movedLine3.startY,
                                              movedLine3.endX, movedLine3.endY)
        var intersectionRight = root.intersect(movedLine2.startX, movedLine2.startY,
                                               movedLine2.endX, movedLine2.endY,
                                               movedLine3.startX, movedLine3.startY,
                                               movedLine3.endX, movedLine3.endY)

        var leftBottom = root.project(1, 0, intersectionLeft.x, intersectionLeft.y)
        var rightBottom = root.project(1, 0, intersectionRight.x, intersectionRight.y)

        root.leftIntersection1 = Qt.point(leftBottom.x, leftBottom.y + path.__height)
        root.rightIntersection2 = Qt.point(rightBottom.x, rightBottom.y + path.__height)

        var leftTop = root.project(-path.__width / 2 , path.__height,
                                   intersectionTop.x - path.__width / 2, intersectionTop.y)

        leftBottom = root.project(-path.__width / 2 , path.__height,
                                  intersectionLeft.x - path.__width / 2, intersectionLeft.y)

        root.leftIntersection2 = Qt.point(leftBottom.x + path.__width / 2, leftBottom.y)
        root.topIntersection1 = Qt.point(leftTop.x + path.__width / 2, leftTop.y)

        var rightTop = root.project(path.__width / 2 , path.__height,
                                    intersectionTop.x - path.__width / 2, intersectionTop.y)

        rightBottom = root.project(path.__width / 2 , path.__height,
                                   intersectionRight.x - path.__width / 2, intersectionRight.y)

        root.topIntersection2 = Qt.point(rightTop.x + path.__width / 2, rightTop.y)
        root.rightIntersection1 = Qt.point(rightBottom.x + path.__width / 2, rightBottom.y)
    }
}
