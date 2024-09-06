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
    \qmltype Star
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A filled star-shaped polygon with an optional border.

    A star can be a star shaped stroke, a filling, or a stroke with filling. The \l strokeColor,
    \l strokeWidth, and \l strokeStyle properties specify the appearance of the outline. The
    \l dashPattern and \l dashOffset properties specify the appearance of dashed stroke.

    Set the \l count property between 3 and 60 to specify the number of points of the star. Set the
    \l ratio between 0.1 and 1 to specify the distance of the inner points of the star from the
    center.

    The area inside the stroke is painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    To create a star with a stroke, set the \l strokeWidth property to a value greater than 0. The
    \l strokeWidth property specifies the width of the polygon stroke.The default \l count value is
    6 and the default \l strokeWidth value is 4. Setting the \l strokeWidth value to a negative
    value hides the border.

    The \l radius property specifies whether the star corners are rounded. Because this introduces
    curved edges to the corners, it may be appropriate to set the \c antialiasing property that is
    inherited from \l Item to improve the appearance of the stroke.

    \section2 Example Usage

    \image studio-star.webp

    The QML code looks as follows:

    \code

    StarItem {
        id: star
        x: 621
        y: 433
        width: 142
        height: 142
        radius: 10
    }

    StarItem {
        id: star1
        x: 786
        y: 433
        width: 142
        height: 142
        radius: 1
        gradient: RadialGradient {
            GradientStop {
                position: 0
                color: "#ce9d9d"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
            focalY: star1.height * 0.5
            focalX: star1.width * 0.5
            focalRadius: Math.min(star1.width, star1.height) * 0
            centerY: star1.height * 0.5
            centerX: star1.width * 0.5
            centerRadius: Math.min(star1.width, star1.height) * 0.5
        }
        count: 7
    }

    StarItem {
        id: star2
        x: 786
        y: 603
        width: 142
        height: 142
        radius: 1
        fillColor: "#00ffffff"
        strokeColor: "#000000"
        ratio: 0.2
        count: 3
    }

    StarItem {
        id: star3
        x: 621
        y: 603
        width: 142
        height: 142
        radius: 1
        gradient: LinearGradient {
            y2: star3.height * 1
            y1: star3.height * 0
            x2: star3.width * 1
            x1: star3.width * 0

            GradientStop {
                position: 0
                color: "#ff8686"
            }

            GradientStop {
                position: 1
                color: "#5c5e5d"
            }
        }
        strokeColor: "#00ff0000"
        ratio: 0.6
        count: 25
    }

    \endcode
*/

Shape {
    id: root
    width: 200
    height: 200

/*!
    \include CommonItemDescriptions.qdocinc {component-radius} {10}
*/
    property int radius: 10

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {star}
*/
    property alias gradient: path.fillGradient

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
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {star}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {star}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {star}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {star}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {star}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {star}
*/
    property alias dashOffset: path.dashOffset

/*!
    The number of points in the star. It supports a minimum of 3 and a maximum of 60 points. Set the
    count to 3 and the \l ratio to 0.5 to create a triangle.

    The default value is 6.
*/
    property int count: 6

/*!
    The distance of the inner points of the star from the center. This
    is represented as percentage of the star's diameter.

    The default value is 0.5.
*/
    property real ratio: 0.5

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== "undefined"
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

        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle

        strokeWidth: 4
        strokeColor: "red"
        startX: 0
        startY: 0
    }

    onWidthChanged: root.constructPolygon()
    onHeightChanged: root.constructPolygon()
    onCountChanged: root.constructPolygon()
    onRadiusChanged: root.constructPolygon()
    onRatioChanged: root.constructPolygon()

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer

        root.constructPolygon()
    }

    property real __centerX: root.width / 2
    property real __centerY: root.height / 2

    Component {
        id: myPathLine
        PathLine {}
    }

    Component {
        id: myPathArc
        PathArc {}
    }

    function constructPolygon() {
        root.clearPathElements()

        if (root.radius === 0)
            root.constructPolygonPath()
        else
            root.constructRoundedPolygonPath()
    }

    function toRadians(degrees) {
        return degrees * (Math.PI / 180.0)
    }

    function toDegrees(radians) {
        return radians * (180.0 / Math.PI)
    }

    function getPoints() {
        let numPoints =  root.count * 2
        let sliceAngle = (360.0 / numPoints)
        // The Draftsman's Method
        let a = root.width / 2 // x-radius
        let b = root.height / 2 // y-radius
        let points = []
        let r = Math.min(Math.max(root.ratio, 0.001), 1.0)

        for (var corner = 0; corner < numPoints; corner++) {
            let angleToCorner = root.toRadians(corner * sliceAngle)
            // Start at top center
            let x = root.__centerX + a * Math.sin(angleToCorner)
            let y = root.__centerY - b * Math.cos(angleToCorner)

            // If the corner is an odd number, move the point towards the center by the ratio (0.001 - 1.0)
            if (corner % 2 === 1) {
                let vec = Qt.vector2d(x - root.__centerX, y - root.__centerY)
                let vecLength = vec.length()
                vec = vec.normalized().times(vecLength * r)

                x = root.__centerX + vec.x
                y = root.__centerY + vec.y
            }

            points.push(Qt.point(x ,y))
        }

        return points
    }

    function constructPolygonPath() {
        let angle = (360.0 / root.sideCount)
        let points = root.getPoints()

        for (var i = 0; i < points.length; i++) {
            if (i === 0) {
                path.startX = points[i].x
                path.startY = points[i].y
            } else {
                let pathLine = myPathLine.createObject(path)
                pathLine.x = points[i].x
                pathLine.y = points[i].y
                path.pathElements.push(pathLine)
            }
        }

        // Close the polygon
        var pathLineClose = myPathLine.createObject(path)
        pathLineClose.x = points[0].x
        pathLineClose.y = points[0].y
        path.pathElements.push(pathLineClose)
    }

    function wrapIndex(index, size) {
        return (index + size) % size
    }

    function constructRoundedPolygonPath() {
        let angle = (360.0 / root.sideCount)
        let points = root.getPoints()

        for (var i = 0; i < points.length; i++) {
            let a = points[root.wrapIndex(i, points.length)]
            let b = points[root.wrapIndex(i - 1, points.length)]
            let c = points[root.wrapIndex(i + 1, points.length)]

            let vAB = Qt.vector2d(b.x - a.x, b.y - a.y)
            let vAC = Qt.vector2d(c.x - a.x, c.y - a.y)

            let alpha = Math.acos(vAB.dotProduct(vAC) / (vAB.length() * vAC.length())) // as radians

            let t = root.radius * (1 / Math.tan(alpha / 2))

            let p1 = vAB.normalized().times(t).plus(Qt.vector2d(a.x, a.y))
            let p2 = vAC.normalized().times(t).plus(Qt.vector2d(a.x, a.y))


            if (i === 0) {
                path.startX = p1.x
                path.startY = p1.y
            } else {
                let pathLine = myPathLine.createObject(path)
                pathLine.x = p1.x
                pathLine.y = p1.y
                path.pathElements.push(pathLine)
            }

            let pathArc = myPathArc.createObject(path)
            pathArc.x = p2.x
            pathArc.y = p2.y
            pathArc.radiusX = root.radius
            pathArc.radiusY = root.radius

            if (i % 2 === 1)
                pathArc.direction = PathArc.Counterclockwise

            path.pathElements.push(pathArc)
        }

        // Close the polygon
        var pathLineClose = myPathLine.createObject(path)
        pathLineClose.x = path.startX
        pathLineClose.y = path.startY
        path.pathElements.push(pathLineClose)
    }

    function clearPathElements() {
        for (var i = 0; i !== path.pathElements.length; ++i)
            path.pathElements[i].destroy()

        path.pathElements = []
    }
}
