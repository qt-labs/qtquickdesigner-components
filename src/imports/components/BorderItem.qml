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
    \qmltype BorderItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A border drawn in four segments: left, top, right, and bottom.

    The Border type is used to create borders out of four segments: left, top, right, and bottom.
    The \l drawLeft, \l drawTop, \l drawRight, and \l drawBottom properties can be used to determine
    whether each of the segments is visible.

    The \l borderMode property determines whether the border is drawn along the inside or outside
    edge of the item, or on top of the edge.

    The \l radius property specifies whether the border corners are rounded. The radius can also be
    specified separately for each corner. Because this introduces curved edges to the corners, it
    may be appropriate to set the \c antialiasing property that is inherited from \l Item to improve
    the appearance of the border.

    The \l joinStyle property specifies how to connect two border line segments.

    The \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify the appearance of the
    border line. The \l dashPattern and \l dashOffset properties specify the appearance of dashed
    lines.

    The \l capStyle property specifies whether line ends are square or rounded.

    \section2 Example Usage

    You can use the Border component in \QDS to create different kinds of borders.

    \image studio-border.webp

    The QML code looks as follows:

    \code
    BorderItem {
        id: openLeft
        width: 99
        height: 99
        antialiasing: true
        drawLeft: false
        strokeColor: "gray"
    }

    BorderItem {
        id: openTop
        width: 99
        height: 99
        antialiasing: true
        strokeColor: "#808080"
        drawTop: false
    }

    BorderItem {
        id: asymmetricalCorners
        width: 99
        height: 99
        antialiasing: true
        bottomLeftRadius: 0
        topRightRadius: 0
        strokeColor: "#808080"
    }

    BorderItem {
        id: dashedBorder
        width: 99
        height: 99
        antialiasing: true
        strokeStyle: 4
        strokeColor: "#808080"
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
    The radius of the top left border corner.

    \sa radius
*/
    property int topLeftRadius: root.radius

/*!
    The radius of the bottom left border corner.

    \sa radius
*/
    property int bottomLeftRadius: root.radius

/*!
    The radius of the top right border corner.

    \sa radius
*/
    property int topRightRadius: root.radius

/*!
    The radius of the bottom right border corner.

    \sa radius
*/
    property int bottomRightRadius: root.radius

/*!
    Whether the border corner is beveled.
*/
    property bool bevel: false

/*!
    The bevel of the top left border corner.

    \sa bevel
*/
    property bool topLeftBevel: root.bevel

/*!
    The bevel of the top right border corner.

    \sa bevel
*/
    property bool topRightBevel: root.bevel

/*!
    The bevel of the bottom right border corner.

    \sa bevel
*/
    property bool bottomRightBevel: root.bevel

/*!
    The bevel of the bottom left border corner.

    \sa bevel
*/
    property bool bottomLeftBevel: root.bevel

/*!
    The width of the border line.
    The default value is 4.
    A width of 1 creates a thin line. For no line, use a negative value or a transparent color.

    \note The width of the border does not affect its position relative to other items if
    anchors are used.
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {border}
*/
    property alias strokeColor: path.strokeColor

/*!
    The dash pattern of the border line specified as the dashes and the gaps
    between them.

    The dash pattern is specified in units of the pen's width. That is, a dash with the length 5
    and width 10 is 50 pixels long.

    Each dash is also subject to cap styles, and therefore a dash of 1 with square cap set will
    extend 0.5 pixels out in each direction resulting in a total width of 2.

    The default \l capStyle is \c {ShapePath.SquareCap}, meaning that a square line end covers the
    end point and extends beyond it by half the line width.

    The default value is (4, 2), meaning a dash of 4 * \l strokeWidth pixels followed by a space
    of 2 * \l strokeWidth pixels.

    \sa QPen::setDashPattern()
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
    property int capStyle: ShapePath.SquareCap //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {border}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    The starting point of the dash pattern for the border line.

    The offset is measured in terms of the units used to specify the dash pattern. For example, a
    pattern where each stroke is four units long, followed by a gap of two units, will begin with
    the stroke when drawn as a line. However, if the dash offset is set to 4.0, any line drawn will
    begin with the gap. Values of the offset up to 4.0 will cause part of the stroke to be drawn
    first, and values of the offset between 4.0 and 6.0 will cause the line to begin with part of
    the gap.

    The default value is 0.

    \sa QPen::setDashOffset()
*/
    property alias dashOffset: path.dashOffset

    //property alias fillColor: path.fillColor

/*!
    Whether the top border is visible.

    The border segment is drawn if this property is set to \c true.
*/
    property bool drawTop: true

/*!
    Whether the bottom border is visible.

    The border segment is drawn if this property is set to \c true.
*/
    property bool drawBottom: true

/*!
    Whether the right border is visible.

    The border segment is drawn if this property is set to \c true.
*/
    property bool drawRight: true

/*!
    Whether the left border is visible.

    The border segment is drawn if this property is set to \c true.
*/
    property bool drawLeft: true

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
        let topRadii = root.topLeftRadius + root.topRightRadius
        let rightRadii = root.topRightRadius + root.bottomRightRadius
        let bottomRadii = root.bottomRightRadius + root.bottomLeftRadius
        let leftRadii = root.bottomLeftRadius + root.topLeftRadius

        let tlr = Math.min(root.width / topRadii, root.height / leftRadii) * root.topLeftRadius
        let trr = Math.min(root.width / topRadii, root.height / rightRadii) * root.topRightRadius
        let brr = Math.min(root.width / bottomRadii, root.height / rightRadii) * root.bottomRightRadius
        let blr = Math.min(root.width / bottomRadii, root.height / leftRadii) * root.bottomLeftRadius

        path.__topLeftRadius = Math.round(Math.min(root.topLeftRadius, tlr))
        path.__topRightRadius = Math.round(Math.min(root.topRightRadius, trr))
        path.__bottomRightRadius = Math.round(Math.min(root.bottomRightRadius, brr))
        path.__bottomLeftRadius = Math.round(Math.min(root.bottomLeftRadius, blr))
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
        fillColor: "transparent"
    }

    onDrawTopChanged: root.constructBorderItem()
    onDrawRightChanged: root.constructBorderItem()
    onDrawBottomChanged: root.constructBorderItem()
    onDrawLeftChanged: root.constructBorderItem()

    function __top_topLeftCorner(): var {
        return {
            x: function() { return path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment },
            y: function() { return root.borderOffset }
        }
    }

    function __top_topRightCorner(): var {
        return {
            x: function() { return root.width - path.__topRightRadius - root.borderOffset - path.__borderRadiusAdjustment },
            y: function() { return root.borderOffset }
        }
    }

    function __right_topRightCorner(): var {
        return {
            x: function() { return root.width - root.borderOffset },
            y: function() { return path.__topRightRadius + root.borderOffset + path.__borderRadiusAdjustment }
        }
    }

    function __right_bottomRightCorner(): var {
        return {
            x: function() { return root.width - root.borderOffset },
            y: function() { return root.height - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment }
        }
    }

    function __bottom_bottomRightCorner(): var {
        return {
            x: function() { return root.width - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment },
            y: function() { return root.height - root.borderOffset }
        }
    }

    function __bottom_bottomLeftCorner(): var {
        return {
            x: function() { return path.__bottomLeftRadius + root.borderOffset + path.__borderRadiusAdjustment },
            y: function() { return root.height - root.borderOffset }
        }
    }

    function __left_bottomLeftCorner(): var {
        return {
            x: function() { return root.borderOffset },
            y: function() { return root.height - path.__bottomLeftRadius - root.borderOffset - path.__borderRadiusAdjustment }
        }
    }

    function __left_topLeftCorner(): var {
        return {
            x: function() { return root.borderOffset },
            y: function() { return path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment }
        }
    }

    function __topLeftRadius(): var {
        return function() { return root.topLeftBevel ? 50000 : path.__topLeftRadius + path.__borderRadiusAdjustment }
    }

    function __topRightRadius(): var {
        return function() { return root.topRightBevel ? 50000 : path.__topRightRadius + path.__borderRadiusAdjustment }
    }

    function __bottomRightRadius(): var {
        return function() { return root.bottomRightBevel ? 50000 : path.__bottomRightRadius + path.__borderRadiusAdjustment }
    }

    function __bottomLeftRadius(): var {
        return function() { return root.bottomLeftBevel ? 50000 : path.__bottomLeftRadius + path.__borderRadiusAdjustment }
    }

    function createPathLine(positionCallback) {
        let component = Qt.createComponent("QtQuick", "PathLine")
        let pathLine = component.createObject(path)
        pathLine.x = Qt.binding(positionCallback().x)
        pathLine.y = Qt.binding(positionCallback().y)
        return pathLine
    }

    function createPathMove(positionCallback) {
        let component = Qt.createComponent("QtQuick", "PathMove")
        let pathMove = component.createObject(path)
        pathMove.x = Qt.binding(positionCallback().x)
        pathMove.y = Qt.binding(positionCallback().y)
        return pathMove
    }

    function createPathArc(positionCallback, radiusCallback) {
        let component = Qt.createComponent("QtQuick", "PathArc")
        let pathArc = component.createObject(path)
        pathArc.x = Qt.binding(positionCallback().x)
        pathArc.y = Qt.binding(positionCallback().y)
        pathArc.radiusX = Qt.binding(radiusCallback())
        pathArc.radiusY = Qt.binding(radiusCallback())
        return pathArc
    }

    function constructBorderItem() {
        root.clearPathElements()

        // If all edges are invisible don't construct anything
        if (!root.drawTop && !root.drawRight && !root.drawBottom && !root.drawLeft)
            return

        let visibleEdges = [root.drawTop, root.drawRight, root.drawBottom, root.drawLeft]

        // Find first visible edge after a hidden edge
        let startIndex = -1
        for (let i = 0; i < 4; i++) {
            let currentEdge = i
            let previousEdge = (i + 3) % 4

            if (!visibleEdges[previousEdge] && visibleEdges[currentEdge]) {
                startIndex = currentEdge
                break
            }
        }

        // If all edges are visible, start from top
        if (startIndex === -1)
            startIndex = 0

        for (let i = 0; i < 4; i++) {
            let currentEdge = (startIndex + i) % 4
            let nextEdge  = (startIndex + i + 1) % 4
            let isFirstEdge = (i === 0)

            switch (currentEdge) {
                case 0: // Top edge
                    if (isFirstEdge) {
                        path.startX = Qt.binding(root.__top_topLeftCorner().x)
                        path.startY = Qt.binding(root.__top_topLeftCorner().y)
                    }
                    if (visibleEdges[currentEdge])
                        path.pathElements.push(root.createPathLine(root.__top_topRightCorner))
                    else
                        path.pathElements.push(root.createPathMove(root.__right_topRightCorner))
                    // Top right corner
                    if (visibleEdges[currentEdge] && visibleEdges[nextEdge])
                        path.pathElements.push(root.createPathArc(root.__right_topRightCorner, root.__topRightRadius))
                    break
                case 1: // Right edge
                    if (isFirstEdge) {
                        path.startX = Qt.binding(root.__right_topRightCorner().x)
                        path.startY = Qt.binding(root.__right_topRightCorner().y)
                    }
                    if (visibleEdges[currentEdge])
                        path.pathElements.push(root.createPathLine(root.__right_bottomRightCorner))
                    else
                        path.pathElements.push(root.createPathMove(root.__bottom_bottomRightCorner))
                    // Bottom right corner
                    if (visibleEdges[currentEdge] && visibleEdges[nextEdge])
                        path.pathElements.push(root.createPathArc(root.__bottom_bottomRightCorner, root.__bottomRightRadius))
                    break
                case 2: // Bottom edge
                    if (isFirstEdge) {
                        path.startX = Qt.binding(root.__bottom_bottomRightCorner().x)
                        path.startY = Qt.binding(root.__bottom_bottomRightCorner().y)
                    }
                    if (visibleEdges[currentEdge])
                        path.pathElements.push(root.createPathLine(root.__bottom_bottomLeftCorner))
                    else
                        path.pathElements.push(root.createPathMove(root.__left_bottomLeftCorner))
                    // Bottom left corner
                    if (visibleEdges[currentEdge] && visibleEdges[nextEdge])
                        path.pathElements.push(root.createPathArc(root.__left_bottomLeftCorner, root.__bottomLeftRadius))
                    break
                case 3: // Left line
                    if (isFirstEdge) {
                        path.startX = Qt.binding(root.__left_bottomLeftCorner().x)
                        path.startY = Qt.binding(root.__left_bottomLeftCorner().y)
                    }
                    if (visibleEdges[currentEdge])
                        path.pathElements.push(root.createPathLine(root.__left_topLeftCorner))
                    else
                        path.pathElements.push(root.createPathMove(root.__top_topLeftCorner))
                    // Top left corner
                    if (visibleEdges[currentEdge] && visibleEdges[nextEdge])
                        path.pathElements.push(root.createPathArc(root.__top_topLeftCorner, root.__topLeftRadius))
                    break
            }
        }
    }

    function clearPathElements() {
        for (var i = 0; i !== path.pathElements.length; ++i)
            path.pathElements[i].destroy()

        path.pathElements = []
    }

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer

        root.calculateIndependentRadii()
        root.constructBorderItem()
    }
}
