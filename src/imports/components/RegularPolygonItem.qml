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
    \qmltype RegularPolygon
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A filled regular polygon with an optional border.

    A regular polygon can be just a 2D polygon shaped stroke, a filling, or a stroke with filling.
    The \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify the appearance of the
    outline. The \l dashPattern and \l dashOffset properties specify the appearance of dashed stroke.

    The area inside the stroke is painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    To create a polygon with a stroke, set the \sideCount property between 3 to 100 and the
    \l strokeWidth property greater than 0. The \l strokeWidth property specifies the width of the
    polygon stroke.The default \l sideCount value is 6 and the default \l strokeWidth value is 4.
    Setting the \l strokeWidth value to a negetive value hides the border.

    The \l radius property specifies whether the polygon corners are rounded. Because this
    introduces curved edges to the corners, it may be appropriate to set the \c antialiasing
    property that is inherited from \l Item to improve the appearance of the stroke.

    \section2 Example Usage

    \image studio-regularpolygon.webp

    The QML code looks as follows:

    \code
    RegularPolygonItem {
        id: regularPolygon
        x: 817
        y: 404
        width: 133
        height: 133
        radius: 10
        strokeColor: "#262525"
        fillColor: "#766e6e"
    }

    RegularPolygonItem {
        id: regularPolygon1
        x: 973
        y: 404
        width: 133
        height: 133
        sideCount: 15
        gradient: RadialGradient {
            GradientStop {
                position: 0
                color: "#c56060"
            }

            GradientStop {
                position: 1
                color: "#665e5e"
            }
            focalY: regularPolygon1.height * 0.5
            focalX: regularPolygon1.width * 0.5
            focalRadius: Math.min(regularPolygon1.width, regularPolygon1.height) * 0
            centerY: regularPolygon1.height * 0.5
            centerX: regularPolygon1.width * 0.5
            centerRadius: Math.min(regularPolygon1.width, regularPolygon1.height) * 0.5
        }
        strokeColor: "#262525"
    }

    RegularPolygonItem {
        id: regularPolygon2
        x: 817
        y: 567
        width: 133
        height: 133
        gradient: ConicalGradient {
            centerY: regularPolygon2.height * 0.5
            centerX: regularPolygon2.width * 0.5
            angle: 0

            GradientStop {
                position: 0
                color: "#fc8e8e"
            }

            GradientStop {
                position: 1
                color: "#f0b9b9"
            }
        }
        joinStyle: 1
        strokeStyle: 4
        strokeColor: "#262525"
        sideCount: 10
    }

    RegularPolygonItem {
        id: regularPolygon3
        x: 973
        y: 567
        width: 133
        height: 133
        strokeWidth: -1
        strokeColor: "#262525"
        sideCount: 7
        gradient: RadialGradient {
            GradientStop {
                position: 0.21053
                color: "#60c2c5"
            }

            GradientStop {
                position: 1
                color: "#deb2b2"
            }
            focalY: regularPolygon3.height * 0.5
            focalX: regularPolygon3.width * 0.5
            focalRadius: Math.min(regularPolygon3.width, regularPolygon3.height) * 0
            centerY: regularPolygon3.height * 0.5
            centerX: regularPolygon3.width * 0.5
            centerRadius: Math.min(regularPolygon3.width, regularPolygon3.height) * 0.5
        }
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
    \include CommonItemDescriptions.qdocinc {component-gradient} {regular polygon}
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
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {regular polygon}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {regular polygon}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {regular polygon}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {regular polygon}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {regular polygon}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {regular polygon}
*/
    property alias dashOffset: path.dashOffset

/*!
    The number of edges on the regular polygon.
    The minimum number of edges can be 3.
    The default value is 6.
*/
    property int sideCount: 6

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
    onSideCountChanged: root.constructPolygon()
    onRadiusChanged: root.constructPolygon()

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer

        root.constructPolygon()
    }

    property real __centerX: root.width / 2
    property real __centerY: root.height / 2

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
        let sliceAngle = (360.0 / root.sideCount)
        // The Draftsman's Method
        let a = root.width / 2 // x-radius
        let b = root.height / 2 // y-radius
        let points = []

        // Go clockwise from top center
        for (var corner = 0; corner < root.sideCount; corner++) {
            let angleToCorner = root.toRadians(corner * sliceAngle)
            // Start at top center
            let x = root.__centerX + a * Math.sin(angleToCorner)
            let y = root.__centerY - b * Math.cos(angleToCorner)

            points.push(Qt.point(x ,y))
        }

        return points
    }

    Component {
        id: myPathLine
        PathLine {}
    }

    Component {
        id: myPathArc
        PathArc {}
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

    // https://stackoverflow.com/questions/58541430/find-intersection-point-of-two-vectors-independent-from-direction
    // This function returns the length of the vector from p to the intersection point of the two lines
    // both defined by a point and a vector.
    function intersect(p: point, dir1: vector2d, q: point, dir2: vector2d) : real {
        let r = dir1.normalized()
        let s = dir2.normalized()

        let pq  = Qt.vector2d(q.x - p.x, q.y - p.y)
        let snv = Qt.vector2d(s.y, -s.x);

        return pq.dotProduct(snv) / r.dotProduct(snv)
    }

    function wrapIndex(index, size) {
        return (index + size) % size
    }

    function constructRoundedPolygonPath() {
        let angle = (360.0 / root.sideCount)
        let points = root.getPoints()

        // A list of vectors that are the bisectors of the inner angles of the polygon.
        // This is used to calculate the intersection point of neighboring bisectors for a corner.
        // The minimum length of the two neighboring corner bisectors intersection point is the
        // maximum for the center of the circle that make up the corner radius.
        let bisectors = []

        // Create angle bisectors by using the parallelolgram rule.
        for (var i = 0; i < points.length; i++) {
            let a = points[root.wrapIndex(i, points.length)]
            let b = points[root.wrapIndex(i - 1, points.length)]
            let c = points[root.wrapIndex(i + 1, points.length)]

            let vAB = Qt.vector2d(b.x - a.x, b.y - a.y).normalized()
            let vAC = Qt.vector2d(c.x - a.x, c.y - a.y).normalized()
            let bisector = vAB.plus(vAC).normalized()

            bisectors.push(bisector)
        }

        for (var i = 0; i < points.length; i++) {
            let a = points[root.wrapIndex(i, points.length)]
            let b = points[root.wrapIndex(i - 1, points.length)]
            let c = points[root.wrapIndex(i + 1, points.length)]
            let r = root.radius

            let vAB = Qt.vector2d(b.x - a.x, b.y - a.y)
            let vAC = Qt.vector2d(c.x - a.x, c.y - a.y)

            // Calculate the intersection points of the two neighboring bisectors
            let tAB = root.intersect(a, bisectors[root.wrapIndex(i, bisectors.length)],
                                     b, bisectors[root.wrapIndex(i - 1, bisectors.length)])
            let tAC = root.intersect(a, bisectors[root.wrapIndex(i, bisectors.length)],
                                     c, bisectors[root.wrapIndex(i + 1, bisectors.length)])
            let tMax = Math.min(tAB, tAC)

            // Angle between the two vectors AB and AC as radians
            let alpha = Math.acos(vAB.dotProduct(vAC) / (vAB.length() * vAC.length()))

            // The maximum radius of the circle that can be drawn at the corner. This is another
            // constraint that Figma uses to calculate the corner radius. The corner radius shouldn't
            // be bigger than half of the distance between the two neighboring corners.
            let maxRadius = Math.round(Qt.vector2d(c.x - b.x, c.y - b.y).length() / 2)
            r = Math.min(r, maxRadius)

            // The optimal length of the corner bisector to place the center of the circle.
            let cLength = r / (Math.sin(alpha / 2))

            // Clamp c to the maximum value found from the intersection points of the bisectors.
            let realC = Math.min(cLength, tMax)

            if (realC < cLength)
                r = realC * Math.sin(alpha / 2)

            let t = Math.sqrt(Math.pow(realC, 2) - Math.pow(r, 2))

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
            pathArc.radiusX = r
            pathArc.radiusY = r

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
