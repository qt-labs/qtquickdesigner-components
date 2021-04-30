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
    \qmltype PieItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A pie.

    The Pie type is used to create a pie slice, a pie that is missing slices,
    or just the pie rind (similar to an \l ArcItem), depending on the \l begin
    and \l end property values and the \l hideLine value.

    The filling of the pie is painted using either a solid fill color, specified
    using the \l fillColor property, or a gradient, defined using one of the
    \l ShapeGradient subtypes and set using the \l gradient property.
    If both a color and a gradient are specified, the gradient is used.

    The \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify
    the appearance of the pie outline. The \l dashPattern and \l dashOffset
    properties specify the appearance of dashed lines.

    The \l capStyle property specifies whether line ends are square or
    rounded.

    Because a pie has curved edges, it may be appropriate to set the
    \c antialiasing property that is inherited from \l Item to improve
    its appearance.

    \section2 Example Usage

    You can use the Pie component in \QDS to create different kinds of pies.

    \image studio-pie.png

    The QML code looks as follows:

    \code
        PieItem {
        id: pieSlice
        antialiasing: true
        strokeColor: "gray"
        fillColor: "light gray"
    }

    PieItem {
        id: pie
        end: 300
        fillColor: "#d3d3d3"
        strokeColor: "#808080"
        antialiasing: true
    }

    PieItem {
        id: pieRind
        strokeWidth: 4
        capStyle: 32
        hideLine: true
        end: 300
        strokeColor: "#808080"
        antialiasing: true
    }
    \endcode
*/

Shape {
    id: root

    implicitWidth: 100
    implicitHeight: 100

/*!
    The gradient of the pie fill color.

    By default, no gradient is enabled and the value is null. In this case, the
    fill uses a solid color based on the value of \l fillColor.

    When set, \l fillColor is ignored and filling is done using one of the
    \l ShapeGradient subtypes.

    \note The \l Gradient type cannot be used here. Rather, prefer using one of
    the advanced subtypes, like \l LinearGradient.
*/
    property alias gradient: path.fillGradient

/*!
    The style of the border line.

    \value ShapePath.SolidLine
           A solid line. This is the default value.
    \value ShapePath.DashLine
           Dashes separated by a few pixels.
           The \l dashPattern property specifies the dash pattern.

    \sa Qt::PenStyle
*/
    property alias strokeStyle: path.strokeStyle

/*!
    The width of the line.

    When set to a negative value, no line is drawn.

    The default value is 4.
*/
    property alias strokeWidth: path.strokeWidth

/*!
    The color of the line.

    When set to \c transparent, no line is drawn.

    The default value is \c red.

    \sa QColor
*/
    property alias strokeColor: path.strokeColor

/*!
    The dash pattern of the line specified as the dashes and the gaps between
    them.

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
    The pie fill color.

    If \l hideLine is \c false, a pie slice is drawn using the values of the
    \l begin and \l end properties and filled with this color.

    If \l hideLine is \c true, just the pie rind is drawn and the area between
    the \l begin and \l end points is filled.

    A gradient for the fill can be specified by using \l gradient. If both a
    color and a gradient are specified, the gradient is used.

    When set to \c transparent, no filling occurs.

    The default value is \c white.
*/
    property alias fillColor: path.fillColor

/*!
    The starting point of the dash pattern for the line.

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
    The cap style of the line.

    \value ShapePath.FlatCap
           A square line end that does not cover the end point of the line.
    \value ShapePath.SquareCap
           A square line end that covers the end point and extends beyond it
           by half the line width. This is the default value.
    \value ShapePath.RoundCap
           A rounded line end.

    \sa Qt::PenCapStyle
*/
    property alias capStyle: path.capStyle

/*!
    The position in degrees where the pie begins.

    The default value is 0.

    To create a circle, set the value of this property to 0 and the value of the
    \l end property to 360.
*/
    property real begin: 0

/*!
    The position in degrees where the pie ends.

    The default value is 90.

    To create a circle, set the value of this property to 360 and the value of
    the \l begin property to 0.
*/
    property real end: 90

/*!
    The area between \l begin and \l end.
*/
    property real alpha: clamp(end - begin,0, 359.9)

    layer.enabled: antialiasing
    layer.smooth: antialiasing
    layer.textureSize: Qt.size(width * 2, height * 2)

    function clamp(num, min, max) {
        return num <= min ? min : num >= max ? max : num;
    }

/*!
    Whether to draw a pie slice or just the pie rind (similar to an \l ArcItem).
*/
    property bool hideLine: {
        if (alpha <= 0)
            return true
        if (alpha >= 359)
            return true
        return false
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

    ShapePath {
        id: path

        property real __xRadius: width / 2 - strokeWidth / 2
        property real __yRadius: height / 2 - strokeWidth / 2

        property real __Xcenter: width / 2
        property real __Ycenter: height / 2

        strokeColor: "red"
        capStyle: ShapePath.FlatCap

        strokeWidth: 4

        startX: root.hideLine ? root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.begin - 90)
                              : __Xcenter
        startY: root.hideLine ? root.polarToCartesianY(path.__Xcenter, path.__Ycenter, path.__yRadius, root.begin - 90)
                              : __Ycenter
        //startX: __Xcenter
        //startY: __Ycenter

        PathLine {
            x: root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.begin - 90)
            y: root.polarToCartesianY(path.__Xcenter, path.__Ycenter, path.__yRadius, root.begin - 90)
        }

        PathArc {
            id: arc

            x: root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.begin + root.alpha - 90)
            y: root.polarToCartesianY(path.__Xcenter, path.__Ycenter,  path.__yRadius, root.begin + root.alpha - 90)

            radiusY: path.__yRadius;
            radiusX: path.__xRadius;

            useLargeArc: root.alpha > 180
        }

        PathLine {
            x: root.hideLine ? root.polarToCartesianX(path.__Xcenter, path.__Ycenter, path.__xRadius, root.begin + root.alpha - 90)
                             : path.__Xcenter
            y: root.hideLine ? root.polarToCartesianY(path.__Xcenter, path.__Ycenter,  path.__yRadius, root.begin + root.alpha - 90)
                             : path.__Ycenter
        }
    }
}

