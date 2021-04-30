/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
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

import QtQuick 2.9
import QtQuick.Shapes 1.0

/*!
    \qmltype ArcItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief An arc that ends at the specified position and uses the specified
    radius.

    An arc is specified by setting values in degrees for the \l begin and
    \l end properties. The arc can be just a line or a filled outline.
    The \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify
    the appearance of the line or outline. The \l dashPattern and \l dashOffset
    properties specify the appearance of dashed lines.

    The area between the arc's start and end points or the area inside the
    outline are painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the
    \l ShapeGradient subtypes and set using the \l gradient property.
    If both a color and a gradient are specified, the gradient is used.

    To create an arc with an outline, set the \l outlineArc property to \c true.
    The \l arcWidth property specifies the width of the arc outline, including
    the stroke. The \l arcWidthBegin and \l arcWidthEnd properties can be used
    to specify the width of the start and end points of the outline separately.
    The width of the outline between the start and end points is calculated
    automatically. The inner and outer curves or the outline can be adjusted by
    specifying values for the \l radiusInnerAdjust and \l radiusOuterAdjust
    properties.

    The \l round, \l roundBegin, and \l roundEnd properties specify whether the
    end points of the arc outline have rounded caps. For an arc that does not
    have an outline, the \l capStyle property specifies whether the line ends
    are square or rounded.

    Because an arc has curves, it may be appropriate to set the \c antialiasing
    property that is inherited from \l Item to improve its appearance.

    \section2 Example Usage

    You can use the Arc component in \QDS to create different kinds of arcs.

    \image studio-arc.png

    The QML code looks as follows:

    \code
    ArcItem {
        id: arc
        x: 31
        y: 31
        capStyle: 32
        end: 180
        strokeWidth: 6
        strokeColor: "#000000"
    }

    ArcItem {
        id: arcOutline
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
        end: 360
        strokeWidth: 5
        strokeColor: "#000000"
    }

    ArcItem {
        id: circleOutline
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

    implicitWidth: 100
    implicitHeight: 100

/*!
    The gradient of the arc fill color.

    By default, no gradient is enabled and the value is null. In this case, the
    fill uses a solid color based on the value of \l fillColor.

    When set, \l fillColor is ignored and filling is done using one of the
    \l ShapeGradient subtypes.

    \note The \l Gradient type cannot be used here. Rather, prefer using one of
    the advanced subtypes, like \l LinearGradient.
*/
    property alias gradient: path.fillGradient

/*!
    The style of the arc line or outline.

    \value ShapePath.SolidLine
           A solid line. This is the default value.
    \value ShapePath.DashLine
           Dashes separated by a few pixels.
           The \l dashPattern property specifies the dash pattern.

    \sa Qt::PenStyle
*/
    property alias strokeStyle: path.strokeStyle

/*!
    The width of the arc line or outline.

    When set to a negative value, no line is drawn.

    The default value is 4.

    The total width of an arc that has an outline (that is, the outline and the
    fill) is specified by \l arcWidth.
*/
    property alias strokeWidth: path.strokeWidth

/*!
    The color of the arc line or outline.

    When set to \c transparent, no line is drawn.

    The default value is \c red.

    \sa QColor
*/
    property alias strokeColor: path.strokeColor

/*!
    The dash pattern of the arc or arc outline specified as the dashes and the
    gaps between them.

    The dash pattern is specified in units of the pen's width. That is, a dash
    with the length 5 and width 10 is 50 pixels long.

    Each dash is also subject to cap styles, and therefore a dash of 1 with
    square cap set will extend 0.5 pixels out in each direction resulting in
    a total width of 2.

    The default \l capStyle is \c {ShapePath.SquareCap}, meaning that a square
    line end covers the end point and extends beyond it by half the line width.

    The default value is (4, 2), meaning a dash of 4 * \l strokeWidth pixels
    followed by a space of 2 * \l strokeWidth pixels.

    \sa QPen::setDashPattern()
*/
    property alias dashPattern: path.dashPattern

    property alias joinStyle: path.joinStyle

/*!
    The arc fill color.

    If the arc is just a line, the area between its \l begin and \l end
    points is filled.

    If the arc has an outline, the area within the outline is filled.

    A gradient for the fill can be specified by using \l gradient. If both a
    color and a gradient are specified, the gradient is used.

    When set to \c transparent, no filling occurs.

    The default value is \c white.
*/
    property alias fillColor: path.fillColor

/*!
    The cap style of the line if the arc does not have an outline.

    \value ShapePath.FlatCap
           A square line end that does not cover the end point of the line.
    \value ShapePath.SquareCap
           A square line end that covers the end point and extends beyond it
           by half the line width. This is the default value.
    \value ShapePath.RoundCap
           A rounded line end.

    \sa round, roundBegin, roundEnd, Qt::PenCapStyle
*/
    property alias capStyle: path.capStyle

/*!
    The starting point of the dash pattern for the arc or arc outline.

    The offset is measured in terms of the units used to specify the dash
    pattern. For example, a pattern where each stroke is four units long,
    followed by a gap of two units, will begin with the stroke when drawn
    as a line. However, if the dash offset is set to 4.0, any line drawn
    will begin with the gap. Values of the offset up to 4.0 will cause part
    of the stroke to be drawn first, and values of the offset between 4.0 and
    6.0 will cause the line to begin with part of the gap.

    The default value is 0.

    \sa QPen::setDashOffset()
*/
    property alias dashOffset: path.dashOffset

/*!
    The position in degrees where the arc begins.

    The default value is 0.

    To create a circle, set the value of this property to 0 and the value
    of the \l end property to 360.
*/
    property real begin: 0

/*!
    The position in degrees where the arc ends.

    The default value is 90.

    To create a circle, set the value of this property to 360 and the value of
    the \l begin property to 0.
*/
    property real end: 90

/*!
    The total width of an arc that has an outline, including the outline and
    fill.

    The default value is 10.

    \sa arcWidthBegin, arcWidthEnd, strokeWidth
*/
    property real arcWidth: 10

/*!
    The width of the beginning of an arc outline.

    \sa arcWidthEnd, arcWidth
*/
    property real arcWidthBegin: arcWidth

/*!
    The width of the end of an arc outline.

   \sa arcWidthBegin, arcWidth
*/
    property real arcWidthEnd: arcWidth

/*!
    The radius of the inside edge of the arc outline.

    This property can be used to adjust the inner curve of the arc outline.
*/
    property real radiusInnerAdjust: 0

/*!
    The radius of the outside edge of the arc outline.

    This property can be used to adjust the outer curve of the arc outline.
*/
    property real radiusOuterAdjust: 0

/*!
    The area between the \l begin and \l end points of the arc.
*/
    property real alpha: clamp(sortedEnd() - sortedBegin(),0, 359.9)

    layer.enabled: antialiasing
    layer.smooth: antialiasing
    layer.textureSize: Qt.size(width * 2, height * 2)

/*!
    Whether the arc has an outline.

    \sa arcWidth, arcWidthBegin, arcWidthEnd, round, roundBegin, roundEnd,
*/
    property bool outlineArc: false

/*!
    Whether the arc outline end points have round caps.

    The \l roundBegin and \l roundEnd properties can be used to specify the
    caps separately for the end points.
*/
    property bool round: false

/*!
    Whether the arc outline ends with a round cap.

    \sa Qt::PenCapStyle, round, roundBegin
*/
    property bool roundEnd: round

/*!
    Whether the arc outline begins with a round cap.

    \sa Qt::PenCapStyle, round, roundEnd
*/
    property bool roundBegin: round

    function clamp(num, min, max) {
        return num <= min ? min : num >= max ? max : num;
    }

    function myCos(angleInDegrees) {
        var angleInRadians = angleInDegrees * Math.PI / 180.0;
        return Math.cos(angleInRadians)
    }

    function mySin(angleInDegrees) {
        var angleInRadians = angleInDegrees * Math.PI / 180.0;
        return Math.sin(angleInRadians)
    }

    function polarToCartesianX(centerX, centerY, radius, angleInDegrees) {
        var angleInRadians = angleInDegrees * Math.PI / 180.0;
        var x = centerX + radius * Math.cos(angleInRadians)
        return x
    }

    function polarToCartesianY(centerX, centerY, radius, angleInDegrees) {
        var angleInRadians = angleInDegrees * Math.PI / 180.0;
        var y = centerY + radius * Math.sin(angleInRadians);
        return y
    }

    function calc()
    {
        path.__xRadius = root.width / 2 - root.strokeWidth / 2
        path.__yRadius = root.height / 2 - root.strokeWidth / 2

        path.__Xcenter = root.width / 2
        path.__Ycenter = root.height / 2

        path.startX = root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.sortedBegin() - 90) +  root.__beginOff * myCos(root.sortedBegin() + 90)
        path.startY = root.polarToCartesianY(path.__Xcenter, path.__Ycenter, path.__yRadius, root.sortedBegin() - 90) + root.__beginOff * mySin(root.sortedBegin() + 90)

        arc1.x = root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.sortedEnd() - 90) + root.__endOff * myCos(root.sortedEnd() + 90)
        arc1.y = root.polarToCartesianY(path.__Xcenter, path.__Ycenter,  path.__yRadius, root.sortedEnd() - 90) + root.__endOff * mySin(root.sortedEnd() + 90)

        arc1.radiusX =  path.__xRadius - root.__endOff / 2 -root.__beginOff / 2 + root.radiusOuterAdjust
        arc1.radiusY =  path.__yRadius - root.__endOff / 2 -root.__beginOff / 2 + root.radiusOuterAdjust

        arc1.useLargeArc =  root.alpha > 180
    }

    function sortedBegin()
    {
        return Math.min(root.begin, root.end)
    }

    function sortedEnd()
    {
        return Math.min(Math.max(root.begin, root.end), sortedBegin() + 359.9)
    }


    onWidthChanged: calc()
    onHeightChanged: calc()
    onBeginChanged: calc()
    onEndChanged: calc()
    onAlphaChanged: calc()

    ShapePath {
        id: path

        property real __xRadius
        property real __yRadius

        property real __Xcenter
        property real __Ycenter

        strokeColor: "red"
        strokeWidth: 4
        capStyle: ShapePath.FlatCap
    }

    property real __beginOff: {

        if (root.arcWidthEnd > root.arcWidthBegin)
            return (root.arcWidthEnd - root.arcWidthBegin) / 2

        return 0;
    }

    property real __endOff: {

        if (root.arcWidthBegin > root.arcWidthEnd)
            return (root.arcWidthBegin - root.arcWidthEnd) / 2

        return 0;
    }

    property real __startP: root.arcWidthBegin + __beginOff
    property real __endP: root.arcWidthEnd + __endOff

    Item {
        id: shapes
        PathArc {
            id: arc1
            property bool add: true
        }

        PathLine {
            relativeX: root.arcWidthEnd * myCos(root.sortedEnd())
            relativeY: root.arcWidthEnd * mySin(root.sortedEnd())
            property bool add: !root.roundEnd && (root.outlineArc && root.alpha < 359.8)

        }

        PathArc {
            relativeX: root.arcWidthEnd * myCos(root.sortedEnd())
            relativeY: root.arcWidthEnd * mySin(root.sortedEnd())
            radiusX: root.arcWidthEnd /2
            radiusY: root.arcWidthEnd /2
            property bool add: root.roundEnd && (root.outlineArc && root.alpha < 359.8)
        }

        PathMove {
            relativeX: root.arcWidthEnd * myCos(root.sortedEnd())
            relativeY: root.arcWidthEnd * mySin(root.sortedEnd())
            property bool add: root.outlineArc && root.alpha > 359.7
        }

        PathArc {
            id: arc2
            useLargeArc: arc1.useLargeArc

            radiusX: path.__xRadius - root.arcWidthBegin + root.__beginOff / 2 + root.__endOff / 2  + root.radiusInnerAdjust
            radiusY:path.__yRadius - root.arcWidthBegin + root.__beginOff / 2 + root.__endOff / 2 + root.radiusInnerAdjust

            x: path.startX + root.arcWidthBegin * myCos(root.sortedBegin())
            y: path.startY + root.arcWidthBegin * mySin(root.sortedBegin())

            direction: PathArc.Counterclockwise

            property bool add: root.outlineArc
        }


        PathLine {
            x: path.startX
            y: path.startY
            property bool add: !root.roundBegin && root.outlineArc && root.alpha < 359.8

        }

        PathArc {
            x: path.startX
            y: path.startY
            radiusX: root.arcWidthEnd /2
            radiusY: root.arcWidthEnd /2
            property bool add: root.roundBegin && root.outlineArc && root.alpha < 359.8
        }

        PathMove {
            x: path.startX
            y: path.startY
            property bool add: root.outlineArc && root.alpha == 360
        }
    }

    function invalidatePaths() {
        if (!root.__completed)
            return

        for (var i = 0; i < shapes.resources.length; i++) {
            var s = shapes.resources[i];
            if (s.add)
                path.pathElements.push(s)
        }

    }

    property bool __completed: false

    Component.onCompleted: {
        root.__completed = true
        invalidatePaths()
        calc()
    }
}
