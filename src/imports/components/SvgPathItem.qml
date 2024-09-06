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
    \qmltype SvgPathItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A path defined using an SVG path data string.

    The SvgPathItem type uses an SVG path data string to draw a path as a line.

    The \l strokeColor, \l strokeWidth, and \l strokeStyle, properties specify the appearance of the
    path. The \l dashPattern and \l dashOffset properties specify the appearance of dashed lines.

    The \l capStyle property specifies whether line ends are square or rounded.

    The \l joinStyle property specifies how to connect two path segments. If the path segments
    enclose areas, they can be painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    If the path has curves, it may be appropriate to set the \c antialiasing property that is
    inherited from \l Item to improve its appearance.

    \section2 Example Usage

    \image studio-svgpathitem.webp

    The QML code looks as follows:

    \code
        SvgPathItem {
            id: sVGPathItem
            x: 2
            y: 3
            width: 152
            height: 154
            strokeWidth: 4
            strokeColor: "black"
            path: "M127.99,0 L150.061,124.052 L22.0704,146.823 L0,22.7711 L127.99,0"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: sVGPathItem1
            x: 56.32
            y: 44.32
            width: 150.06
            height: 146.82
            strokeWidth: 4
            strokeColor: "black"
            path: "M127.99,0 L150.061,124.052 L22.0704,146.823 L0,22.7711 L127.99,0"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: sVGPathItem2
            x: 3.18
            y: 27.38
            width: 55
            height: 40
            strokeWidth: 4
            strokeColor: "black"
            path: "M0,0 L55,40"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: sVGPathItem3
            x: 130.21
            y: 2.41
            width: 55
            height: 42
            strokeWidth: 4
            strokeColor: "black"
            path: "M0,0 L55,42"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: sVGPathItem4
            x: 22
            y: 148
            width: 56
            height: 43
            strokeWidth: 4
            strokeColor: "black"
            path: "M0,0 L54,40"
            fillColor: "transparent"
        }

        SvgPathItem {
            id: sVGPathItem5
            x: 151.21
            y: 126.41
            width: 55
            height: 42
            strokeWidth: 4
            strokeColor: "black"
            path: "M0,0 L55,42"
            fillColor: "transparent"
        }
        clip: false
    \endcode

*/

Shape {
    id: root
    width: 200
    height: 200

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {SVG Path Item}
*/
    property alias gradient: shape.fillGradient

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
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {SVG Path Item}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {SVG Path Item}
*/
    property alias strokeWidth: shape.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {SVG Path Item}
*/
    property alias strokeColor: shape.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {SVG Path Item}
*/
    property alias dashPattern: shape.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {SVG Path Item}
*/
    property alias fillColor: shape.fillColor

/*!
    \qmlproperty string SvgPathItem::path

    The SVG path data string specifying the path.

    For more information, see \l{https://www.w3.org/TR/SVG/paths.html#PathData} {W3C SVG Path Data}.
*/
    property alias path: pathSvg.path

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {SVG Path Item}
*/
    property alias dashOffset: shape.dashOffset

    property bool __preferredRendererTypeAvailable: root.preferredRendererType !== undefined
    property bool __curveRendererActive: root.__preferredRendererTypeAvailable
                                         && root.rendererType === Shape.CurveRenderer

    layer.enabled: root.antialiasing && !root.__curveRendererActive
    layer.smooth: root.antialiasing && !root.__curveRendererActive
    layer.samples: root.antialiasing && !root.__curveRendererActive ? 4 : 0

    ShapePath {
        id: shape
        strokeWidth: 4
        strokeColor: "red"
        capStyle: root.capStyle
        strokeStyle: root.strokeStyle
        joinStyle: root.joinStyle


        PathSvg {
            id: pathSvg

            path: "M91,70.6c4.6,0,8.6,2.4,10.9,6.3l19.8,34.2c2.3,3.9,2.3,8.7,0,12.6c-2.3,3.9-6.4,6.3-10.9,6.3H71.2 c-4.6,0-8.6-2.4-10.9-6.3c-2.3-3.9-2.3-8.7,0-12.6l19.8-34.2C82.4,72.9,86.4,70.6,91,70.6z"
        }
    }

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer
    }
}
