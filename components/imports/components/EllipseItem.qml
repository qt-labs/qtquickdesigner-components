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
    \qmltype EllipseItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape

    \brief A filled ellipse with an optional border.

    An ellipse can be just an ellipse shaped stroke, a filling, or a stroke with filling. The
    \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify the appearance of the
    outline. The \l dashPattern and \l dashOffset properties specify the appearance of a dashed
    stroke.

    The area inside the stroke is painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    To create an ellipse with a stroke, set a \l strokeWidth property that is greater than 0. The
    \l strokeWidth property specifies the width of the ellipse stroke. The default \l strokeWidth
    value is 4. Setting the \l strokeWidth value to -1 hides the border. To set the border outside,
    inside, or on top of the ellipse's boundary, use \l borderMode. The default value 0 sets the
    border inside the ellipse's boundary.

    \section2 Example Usage

    \image studio-ellipse.webp

    The QML code looks as follows:

    \code
    EllipseItem {
        id: ellipse
        x: 571
        y: 199
        width: 167
        height: 125
        strokeColor: "#808080"
        strokeStyle: 1
        borderMode: 0
        strokeWidth: 4
    }

    EllipseItem {
        id: ellipseStroke
        x: 773
        y: 199
        width: 167
        height: 125
        fillColor: "#00ffffff"
        strokeWidth: 4
        strokeStyle: 1
        strokeColor: "#808080"
        borderMode: 0
    }

    EllipseItem {
        id: ellipseFilling
        x: 571
        y: 350
        width: 167
        height: 125
        strokeWidth: -1
        strokeStyle: 1
        strokeColor: "#808080"
        borderMode: 0
    }

    EllipseItem {
        id: ellipseDashDotStroke
        x: 773
        y: 350
        width: 167
        height: 125
        strokeWidth: 4
        strokeStyle: 4
        strokeColor: "#808080"
        fillColor: "#00ffffff"
        borderMode: 0
    }
    \endcode
*/

Shape {
    id: root
    width: 200
    height: 150
/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {ellipse}
*/
    property alias gradient: path.fillGradient

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {ellipse}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {ellipse}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {ellipse}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {ellipse}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {ellipse}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {ellipse}
*/
    property alias dashOffset: path.dashOffset

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

    ShapePath {
        id: path

        joinStyle: ShapePath.MiterJoin
        strokeWidth: 4
        strokeColor: "red"
        startX: root.width * 0.5
        startY: root.borderOffset

        strokeStyle: root.strokeStyle

        PathArc {
            x: path.startX
            y: root.height - root.borderOffset
            radiusX: root.width * 0.5 - root.borderOffset
            radiusY: root.height * 0.5 - root.borderOffset
            useLargeArc: true
        }

        PathArc {
            x: path.startX
            y: path.startY
            radiusX: root.width * 0.5 - root.borderOffset
            radiusY: root.height * 0.5 - root.borderOffset
            useLargeArc: true
        }
    }

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer
    }
}
