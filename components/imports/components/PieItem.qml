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
    \qmltype PieItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A pie.

    The Pie type is used to create a pie slice, a pie that is missing slices, or just the pie stroke
    (similar to an \l ArcItem), depending on the \l begin and \l end property values and the
    \l hideLine value.

    The filling of the pie is painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    The \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify the appearance of the
    pie outline. The \l dashPattern and \l dashOffset properties specify the appearance of dashed
    lines.

    The \l capStyle property specifies whether line ends are square or rounded.

    \section2 Example Usage

    You can use the Pie component in \QDS to create different kinds of pies.

    \image studio-pie.webp

    The QML code looks as follows:

    \code
    PieItem {
        id: pieSlice
        x: 920
        y: 416
        strokeWidth: -1
        antialiasing: true
        strokeColor: "gray"
        fillColor: "light gray"
    }

    PieItem {
        id: pie
        x: 1118
        y: 407
        end: 300
        fillColor: "#d3d3d3"
        strokeColor: "#808080"
        antialiasing: true
    }

    PieItem {
        id: pieStroke
        x: 1022
        y: 548
        fillColor: "#00ffffff"
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

    width: 100
    height: 100

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {pie}
*/
    property alias gradient: path.fillGradient

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
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {pie}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {pie}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {pie}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {pie}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {pie}

    If \l hideLine is \c false, a pie slice is drawn using the values of the \l begin and \l end
    properties and filled with this color.

    If \l hideLine is \c true, just the pie stroke is drawn and the area between the \l begin and
    \l end points is filled.
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {pie}
*/
    property alias dashOffset: path.dashOffset

/*!
    The position in degrees where the pie begins.

    The default value is 0.

    To create a circle, set the value of this property to 0 and the value of the \l end property to
    360.
*/
    property real begin: 0

/*!
    The position in degrees where the pie ends.

    The default value is 90.

    To create a circle, set the value of this property to 360 and the value of the \l begin property
    to 0.
*/
    property real end: 90

/*!
    The area between \l begin and \l end.
*/
    property real alpha: root.clamp(root.end - root.begin, 0, 359.9)

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== undefined
    property bool __curveRendererActive: root.__preferredRendererTypeAvailable
                                         && root.rendererType === Shape.CurveRenderer

    layer.enabled: root.antialiasing && !root.__curveRendererActive
    layer.smooth: root.antialiasing && !root.__curveRendererActive
    layer.samples: root.antialiasing && !root.__curveRendererActive ? 4 : 0

    function clamp(num, min, max) {
        return Math.max(min, Math.min(num, max))
    }

/*!
    Whether to draw a pie slice or just the pie stroke (similar to an \l ArcItem).
*/
    property bool hideLine: {
        if (root.alpha <= 0)
            return true
        if (root.alpha >= 359)
            return true
        return false
    }

    function toRadians(degrees) {
        return degrees * (Math.PI / 180.0)
    }

    function polarToCartesianX(centerX, centerY, radius, angleInDegrees) {
        return centerX + radius * Math.cos(root.toRadians(angleInDegrees))
    }

    function polarToCartesianY(centerX, centerY, radius, angleInDegrees) {
        return centerY + radius * Math.sin(root.toRadians(angleInDegrees))
    }

    ShapePath {
        id: path

        property real __xRadius: root.width / 2 - root.strokeWidth / 2
        property real __yRadius: root.height / 2 - root.strokeWidth / 2

        property real __xCenter: root.width / 2
        property real __yCenter: root.height / 2

        strokeColor: "red"
        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle

        strokeWidth: 4

        startX: root.hideLine ? root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.begin - 90)
                              : path.__xCenter
        startY: root.hideLine ? root.polarToCartesianY(path.__xCenter, path.__yCenter, path.__yRadius, root.begin - 90)
                              : path.__yCenter

        PathLine {
            x: root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.begin - 90)
            y: root.polarToCartesianY(path.__xCenter, path.__yCenter, path.__yRadius, root.begin - 90)
        }

        PathArc {
            id: arc

            x: root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.begin + root.alpha - 90)
            y: root.polarToCartesianY(path.__xCenter, path.__yCenter,  path.__yRadius, root.begin + root.alpha - 90)

            radiusY: path.__yRadius;
            radiusX: path.__xRadius;

            useLargeArc: root.alpha > 180
        }

        PathLine {
            x: root.hideLine ? root.polarToCartesianX(path.__xCenter, path.__yCenter, path.__xRadius, root.begin + root.alpha - 90)
                             : path.__xCenter
            y: root.hideLine ? root.polarToCartesianY(path.__xCenter, path.__yCenter,  path.__yRadius, root.begin + root.alpha - 90)
                             : path.__yCenter
        }
    }

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer
    }
}

