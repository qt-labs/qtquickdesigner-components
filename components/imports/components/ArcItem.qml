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
    \qmltype ArcItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape


    \brief An arc that ends at the specified position and uses the specified radius.

    An arc is specified by setting values in degrees for the \l begin and \l end properties. The arc
    can be just a line or a filled outline. The \l strokeColor, \l strokeWidth, and \l strokeStyle
    properties specify the appearance of the line or outline. The \l dashPattern and \l dashOffset
    properties specify the appearance of dashed lines.

    The area between the arc's start and end points or the area inside the outline are painted using
    either a solid fill color, specified using the \l fillColor property, or a gradient, defined
    using one of the \l ShapeGradient subtypes and set using the \l gradient property. If both a
    color and a gradient are specified, the gradient is used.

    To create an arc with an outline, set the \l outlineArc property to \c true. The \l arcWidth
    property specifies the width of the arc outline, including the stroke. The width of the outline
    between the start and end points is calculated automatically.

    The \l round, \l roundBegin, and \l roundEnd properties specify whether the end points of the
    arc outline have rounded caps. For an arc that does not have an outline, the \l capStyle
    property specifies whether the line ends are square or rounded.

    Because an arc has curves, it may be appropriate to set the \c antialiasing property that is
    inherited from \l Item to improve its appearance.

    \section2 Example Usage

    You can use the Arc component in \QDS to create different kinds of arcs.

    \image studio-arc.webp

    The QML code looks as follows:

    \code

    ArcItem {
        id: arc
        x: 667
        y: 490
        fillColor: "#00ffffff"
        capStyle: 32
        end: 180
        strokeWidth: 6
        strokeColor: "#000000"
    }

    ArcItem {
        id: arcOutline
        x: 910
        y: 490
        strokeColor: "gray"
        arcWidth: 13
        end: 180
        fillColor: "light gray"
        antialiasing: true
        round: true
        outlineArc: true
    }

    ArcItem {
        id: circle
        x: 811
        y: 490
        fillColor: "#02ffffff"
        end: 360
        strokeWidth: 5
        strokeColor: "#000000"
    }

    ArcItem {
        id: circleOutline
        x: 1046
        y: 490
        antialiasing: false
        outlineArc: true
        round: true
        strokeColor: "gray"
        fillColor: "light gray"
        strokeWidth: 1
        end: 360
    }
    \endcode
*/

Shape {
    id: root

    width: 100
    height: 100

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {arc}
*/
    property alias gradient: path.fillGradient

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {arc}

    The total width of an arc that has an outline (that is, the outline and the fill) is specified
    by \l arcWidth.
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {arc}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {arc}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc component-joinStyle
*/
    //property alias joinStyle: path.joinStyle
    property int joinStyle: ShapePath.BevelJoin //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc component-capStyle
*/
    //property alias capStyle: path.capStyle
    property int capStyle: ShapePath.FlatCap //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {arc}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {arc}

    If the arc is just a line, the area between its \l begin and \l end points is filled. If the arc
    has an outline, the area within the outline is filled.
*/
    property alias fillColor: path.fillColor

/*!
    The starting point of the dash pattern for the arc or arc outline.

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

/*!
    The position in degrees where the arc begins.

    The default value is 0.

    To create a circle, set the value of \c begin to 0 and the value of the \c end to 360.
*/
    property real begin: 0

/*!
    The position in degrees where the arc ends.

    The default value is 90.

    To create a circle, set the value of \c end to 360 and the value of the \c begin to 0.
*/
    property real end: 90

/*!
    The total width of an arc that has an outline, including the outline and fill.

    The default value is 10.

    \sa strokeWidth
*/
    property real arcWidth: 10

/*!
    The area between the \l begin and \l end points of the arc.
*/
    property real alpha: root.clamp(root.sortedEnd() - root.sortedBegin(), 0, 359.9)

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== undefined
    property bool __curveRendererActive: root.__preferredRendererTypeAvailable
                                         && root.rendererType === Shape.CurveRenderer

    layer.enabled: root.antialiasing && !root.__curveRendererActive
    layer.smooth: root.antialiasing && !root.__curveRendererActive
    layer.samples: root.antialiasing && !root.__curveRendererActive ? 4 : 0

/*!
    Whether the arc has an outline.

    \sa arcWidth, round, roundBegin, roundEnd
*/
    property bool outlineArc: false

/*!
    Whether the arc outline end points have round caps.

    The \l roundBegin and \l roundEnd properties can be used to specify the caps separately for the
    end points.
*/
    property bool round: false

/*!
    Whether the arc outline ends with a round cap.

    \sa Qt::PenCapStyle, round, roundBegin
*/
    property bool roundEnd: root.round

/*!
    Whether the arc outline begins with a round cap.

    \sa Qt::PenCapStyle, round, roundEnd
*/
    property bool roundBegin: root.round

    function clamp(num, min, max) {
        return Math.max(min, Math.min(num, max))
    }

    function toRadians(degrees) {
        return degrees * (Math.PI / 180.0)
    }

    function myCos(angleInDegrees) {
        return Math.cos(root.toRadians(angleInDegrees))
    }

    function mySin(angleInDegrees) {
        return Math.sin(root.toRadians(angleInDegrees))
    }

    function polarToCartesianX(centerX, centerY, radius, angleInDegrees) {
        return centerX + radius * Math.cos(root.toRadians(angleInDegrees))
    }

    function polarToCartesianY(centerX, centerY, radius, angleInDegrees) {
        return centerY + radius * Math.sin(root.toRadians(angleInDegrees))
    }

    function sortedBegin() {
        return Math.min(root.begin, root.end)
    }

    function sortedEnd() {
        return Math.min(Math.max(root.begin, root.end), root.sortedBegin() + 359.9)
    }

    function isArcFull() {
        return root.alpha > 359.5
    }

    onAlphaChanged: {
        if (root.__wasFull !== root.isArcFull())
            root.constructArcItem()

        root.__wasFull = root.isArcFull()
    }
    onOutlineArcChanged: root.constructArcItem()
    onRoundChanged: root.constructArcItem()
    onRoundBeginChanged: root.constructArcItem()
    onRoundEndChanged: root.constructArcItem()

    property bool __wasFull: false

    property real maxArcWidth: Math.min(path.__xRadius, path.__yRadius)

    ShapePath {
        id: path

        property real __xRadius: root.width / 2 - root.strokeWidth / 2
        property real __yRadius: root.height / 2 - root.strokeWidth / 2

        property real __arcWidth: Math.min(Math.min(path.__xRadius, path.__yRadius), root.arcWidth)

        property real __xCenter: root.width / 2
        property real __yCenter: root.height / 2

        strokeColor: "red"
        strokeWidth: 4
        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle

        startX: root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.sortedBegin() - 90)
        startY: root.polarToCartesianY(path.__xCenter, path.__yCenter, path.__yRadius, root.sortedBegin() - 90)
    }

    function constructArcItem() {
        root.clearPathElements()

        // Outer arc
        let outerArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
        outerArc.x = Qt.binding(function() {
            return root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.sortedEnd() - 90)
        })
        outerArc.y = Qt.binding(function() {
            return root.polarToCartesianY(path.__xCenter, path.__yCenter, path.__yRadius, root.sortedEnd() - 90)
        })
        outerArc.radiusX = Qt.binding(function() { return path.__xRadius })
        outerArc.radiusY = Qt.binding(function() { return path.__yRadius })
        outerArc.useLargeArc = Qt.binding(function() { return root.alpha > 180 })
        path.pathElements.push(outerArc)

        // Straight end
        if (!root.roundEnd && root.outlineArc && !root.isArcFull()) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.relativeX = Qt.binding(function() {
                return -path.__arcWidth * root.myCos(root.sortedEnd() - 90)
            })
            pathLine.relativeY = Qt.binding(function() {
                return -path.__arcWidth * root.mySin(root.sortedEnd() - 90)
            })
            path.pathElements.push(pathLine)
        }

        // Round end
        if (root.roundEnd && root.outlineArc && !root.isArcFull()) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.relativeX = Qt.binding(function() {
                return -path.__arcWidth * root.myCos(root.sortedEnd() - 90)
            })
            pathArc.relativeY = Qt.binding(function() {
                return -path.__arcWidth * root.mySin(root.sortedEnd() - 90)
            })
            pathArc.radiusX = Qt.binding(function() { return path.__arcWidth / 2 })
            pathArc.radiusY = Qt.binding(function() { return path.__arcWidth / 2 })
            path.pathElements.push(pathArc)
        }

        // Open end
        if (root.outlineArc && root.isArcFull()) {
            let pathMove = Qt.createQmlObject('import QtQuick 2.15; PathMove {}', path)
            pathMove.relativeX = Qt.binding(function() {
                return -path.__arcWidth * root.myCos(root.sortedEnd() - 90)
            })
            pathMove.relativeY = Qt.binding(function() {
                return -path.__arcWidth * root.mySin(root.sortedEnd() - 90)
            })
            path.pathElements.push(pathMove)
        }

        // Inner arc
        if (root.outlineArc) {
            let innerArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            innerArc.x = Qt.binding(function() {
                return path.startX - path.__arcWidth * root.myCos(root.sortedBegin() - 90)
            })
            innerArc.y = Qt.binding(function() {
                return path.startY - path.__arcWidth * root.mySin(root.sortedBegin() - 90)
            })
            innerArc.radiusX = Qt.binding(function() { return path.__xRadius - path.__arcWidth })
            innerArc.radiusY = Qt.binding(function() { return path.__yRadius - path.__arcWidth })
            innerArc.useLargeArc = Qt.binding(function() { return root.alpha > 180 })
            innerArc.direction = PathArc.Counterclockwise
            path.pathElements.push(innerArc)
        }

        // Straight begin
        if (!root.roundBegin && root.outlineArc && !root.isArcFull()) {
            let pathLine = Qt.createQmlObject('import QtQuick 2.15; PathLine {}', path)
            pathLine.x = Qt.binding(function() { return path.startX })
            pathLine.y = Qt.binding(function() { return path.startY })
            path.pathElements.push(pathLine)
        }

        // Round begin
        if (root.roundBegin && root.outlineArc && !root.isArcFull()) {
            let pathArc = Qt.createQmlObject('import QtQuick 2.15; PathArc {}', path)
            pathArc.x = Qt.binding(function() { return path.startX })
            pathArc.y = Qt.binding(function() { return path.startY })
            pathArc.radiusX = Qt.binding(function() { return path.__arcWidth / 2 })
            pathArc.radiusY = Qt.binding(function() { return path.__arcWidth / 2 })
            path.pathElements.push(pathArc)
        }

        // Open begin
        if (root.outlineArc && root.isArcFull()) {
            let pathMove = Qt.createQmlObject('import QtQuick 2.15; PathMove {}', path)
            pathMove.x = Qt.binding(function() { return path.startX })
            pathMove.y = Qt.binding(function() { return path.startY })
            path.pathElements.push(pathMove)
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

        root.__wasFull = root.isArcFull()
        root.constructArcItem()
    }
}
