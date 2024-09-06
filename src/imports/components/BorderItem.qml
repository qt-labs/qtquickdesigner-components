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
        fillColor: "transparent"

        startX: path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment
        startY: root.borderOffset
    }

    onDrawTopChanged: root.constructBorderItem()
    onDrawRightChanged: root.constructBorderItem()
    onDrawBottomChanged: root.constructBorderItem()
    onDrawLeftChanged: root.constructBorderItem()

    function constructBorderItem() {
        root.clearPathElements()

        // Top line
        if (root.drawTop) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.x = Qt.binding(function() { return root.width - path.__topRightRadius - root.borderOffset - path.__borderRadiusAdjustment })
            pathLine.y = Qt.binding(function() { return root.borderOffset })
            path.pathElements.push(pathLine)
        } else {
            let pathMove = Qt.createQmlObject('import QtQuick 2.15; PathMove {}', path)
            pathMove.x = Qt.binding(function() { return root.width - root.borderOffset })
            pathMove.y = Qt.binding(function() { return path.__topRightRadius + root.borderOffset + path.__borderRadiusAdjustment })
            path.pathElements.push(pathMove)
        }

        // Top right corner
        if (root.drawTop && root.drawRight) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.x = Qt.binding(function() { return root.width - root.borderOffset })
            pathArc.y = Qt.binding(function() { return path.__topRightRadius + root.borderOffset + path.__borderRadiusAdjustment })
            pathArc.radiusX = Qt.binding(function() { return root.topRightBevel ? 50000 : path.__topRightRadius + path.__borderRadiusAdjustment })
            pathArc.radiusY = Qt.binding(function() { return root.topRightBevel ? 50000 : path.__topRightRadius + path.__borderRadiusAdjustment })
            path.pathElements.push(pathArc)
        }

        // Right line
        if (root.drawRight) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.x = Qt.binding(function() { return root.width - root.borderOffset })
            pathLine.y = Qt.binding(function() { return root.height - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment })
            path.pathElements.push(pathLine)
        } else {
            let pathMove = Qt.createQmlObject('import QtQuick 2.15; PathMove {}', path)
            pathMove.x = Qt.binding(function() { return root.width - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment })
            pathMove.y = Qt.binding(function() { return root.height - root.borderOffset })
            path.pathElements.push(pathMove)
        }

        // Bottom right corner
        if (root.drawBottom && root.drawRight) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.x = Qt.binding(function() { return root.width - path.__bottomRightRadius - root.borderOffset - path.__borderRadiusAdjustment })
            pathArc.y = Qt.binding(function() { return root.height - root.borderOffset })
            pathArc.radiusX = Qt.binding(function() { return root.bottomRightBevel ? 50000 : path.__bottomRightRadius + path.__borderRadiusAdjustment })
            pathArc.radiusY = Qt.binding(function() { return root.bottomRightBevel ? 50000 : path.__bottomRightRadius + path.__borderRadiusAdjustment })
            path.pathElements.push(pathArc)
        }

        // Bottom line
        if (root.drawBottom) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.x = Qt.binding(function() { return path.__bottomLeftRadius + root.borderOffset + path.__borderRadiusAdjustment })
            pathLine.y = Qt.binding(function() { return root.height - root.borderOffset })
            path.pathElements.push(pathLine)
        } else {
            let pathMove = Qt.createQmlObject('import QtQuick 2.15; PathMove {}', path)
            pathMove.x = Qt.binding(function() { return root.borderOffset })
            pathMove.y = Qt.binding(function() { return root.height - path.__bottomLeftRadius - root.borderOffset - path.__borderRadiusAdjustment })
            path.pathElements.push(pathMove)
        }

        // Bottom left corner
        if (root.drawBottom && root.drawLeft) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.x = Qt.binding(function() { return root.borderOffset })
            pathArc.y = Qt.binding(function() { return root.height - path.__bottomLeftRadius - root.borderOffset - path.__borderRadiusAdjustment })
            pathArc.radiusX = Qt.binding(function() { return root.bottomLeftBevel ? 50000 : path.__bottomLeftRadius + path.__borderRadiusAdjustment })
            pathArc.radiusY = Qt.binding(function() { return root.bottomLeftBevel ? 50000 : path.__bottomLeftRadius + path.__borderRadiusAdjustment })
            path.pathElements.push(pathArc)
        }

        // Left line
        if (root.drawLeft) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.x = Qt.binding(function() { return root.borderOffset })
            pathLine.y = Qt.binding(function() { return path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment })
            path.pathElements.push(pathLine)
        }
        // No need to use PathMove, if left line shouldn't be drawn we just leave the shape open.

        // Top left corner
        if (root.drawTop && root.drawLeft) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.x = Qt.binding(function() { return path.__topLeftRadius + root.borderOffset + path.__borderRadiusAdjustment })
            pathArc.y = Qt.binding(function() { return root.borderOffset })
            pathArc.radiusX = Qt.binding(function() { return root.topLeftBevel ? 50000 : path.__topLeftRadius + path.__borderRadiusAdjustment })
            pathArc.radiusY = Qt.binding(function() { return root.topLeftBevel ? 50000 : path.__topLeftRadius + path.__borderRadiusAdjustment })
            path.pathElements.push(pathArc)
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
