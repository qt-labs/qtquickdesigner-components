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
    \qmltype Text
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Shape
    \inherits Text

    \brief A filled text with an optional border.

    A text can be a text shaped stroke, a filling, or a stroke with filling. The
    \l strokeColor, \l strokeWidth, and \l strokeStyle properties specify the appearance of the
    outline. The \l dashPattern and \l dashOffset properties specify the appearance of a dashed
    stroke.

    The area inside the text is painted using either a solid fill color, specified using the
    \l fillColor property, or a gradient, defined using one of the \l ShapeGradient subtypes and set
    using the \l gradient property. If both a color and a gradient are specified, the gradient is
    used.

    To create a text with a stroke, set a \l strokeWidth property that is greater than 0. The
    \l strokeWidth property specifies the width of the text stroke. The default \l strokeWidth
    value is 4. Setting the \l strokeWidth value to -1 hides the border.

    Text supports only plain strings. The \l font properties are applied to the \l text.

    \section2 Example Usage

    \image studio-text.webp

    The QML code looks as follows:

    \code
    TextItem {
        id: _text
        x: 874
        y: 213
        text: qsTr("Qt")
        font.pixelSize: 120
        fillColor: "#00ffffff"
        strokeColor: "#1e8f00"
        font.bold: true
        strokeWidth: 2
    }

    TextItem {
        id: _text1
        x: 1033
        y: 213
        text: qsTr("Qt")
        font.pixelSize: 120
        gradient: LinearGradient {
            y2: _text1.height * 1
            y1: _text1.height * 0
            x2: _text1.width * 1
            x1: _text1.width * 0
            GradientStop {
                position: 0
                color: "#00d158"
            }

            GradientStop {
                position: 0.55263
                color: "#ffffff"
            }
        }
        strokeWidth: 2
        strokeColor: "#ff0000"
        font.bold: true
    }

    TextItem {
        id: _text2
        x: 874
        y: 402
        text: qsTr("Qt")
        font.pixelSize: 120
        strokeStyle: 3
        strokeWidth: 2
        strokeColor: "#474747"
        font.bold: true
    }

    TextItem {
        id: _text3
        x: 1033
        y: 402
        text: qsTr("Qt")
        font.pixelSize: 120
        gradient: RadialGradient {
            focalY: _text3.height * 0.5
            focalX: _text3.width * 0.5
            focalRadius: Math.min(_text3.width, _text3.height) * 0
            centerY: _text3.height * 0.5
            centerX: _text3.width * 0.5
            centerRadius: Math.min(_text3.width, _text3.height) * 0.5

            GradientStop {
                position: 0.10526
                color: "#00ffab"
            }

            GradientStop {
                position: 1
                color: "#ff000000"
            }
        }
        strokeWidth: -1
        strokeColor: "#1e8f00"
        font.bold: true
    }
    \endcode
*/

Shape {
    id: root
    width: textMetrics.advanceWidth
    height: Math.ceil(textMetrics.height) // TODO

/*!
    \include CommonItemDescriptions.qdocinc {component-gradient} {text}
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
    \include CommonItemDescriptions.qdocinc {component-strokeStyle} {text}
*/
    //property alias strokeStyle: path.strokeStyle
    property int strokeStyle: ShapePath.SolidLine //workaround for regression in Qt 6.6.1 (QDS-11845)

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeWidth} {text}
*/
    property alias strokeWidth: path.strokeWidth

/*!
    \include CommonItemDescriptions.qdocinc {component-strokeColor} {text}
*/
    property alias strokeColor: path.strokeColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashPattern} {text}
*/
    property alias dashPattern: path.dashPattern

/*!
    \include CommonItemDescriptions.qdocinc {component-fillColor} {text}
*/
    property alias fillColor: path.fillColor

/*!
    \include CommonItemDescriptions.qdocinc {component-dashOffset} {text}
*/
    property alias dashOffset: path.dashOffset

/*!
    The font properties for the \l text. Change the \l {QFont::family} {family},
    \l {QFont::letterSpacing} {letterSpacing}, \l {QFont::pixelSize} {pixelSize},
    \l {QFont::wordSpacing} {wordSpacing}, \l {QFont::weight} {weight} of the \l text using these
    properties.You can also set wheather the \l text has auto \l {QFont::kerning} {kerning} or if it
    follows the \l {QtQuick::Text::font.preferShaping} {preferShaping} using the font specific
    features. Also sets your preferred font \l {QFont::capitalization} {capitalization} method and
    \l {QFont::styleName} {styleName} for the \l text.

    \sa QFont Text
*/
    property alias font: pathText.font

/*!
    The text to display. Text supports only plain strings.

    \sa QFont Text
*/
    property alias text: pathText.text

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

        PathText {
            id: pathText
            x: 0
            y: fontMetrics.height + textMetrics.tightBoundingRect.y - fontMetrics.descent
            font.family: "Arial"
        }
    }

    TextMetrics {
        id: textMetrics
        font: pathText.font
        text: pathText.text
    }

    FontMetrics {
        id: fontMetrics
        font: pathText.font
    }

    Component.onCompleted: {
        // If preferredRendererType wasn't set initially make CurveRenderer the default
        if (root.__preferredRendererTypeAvailable && root.preferredRendererType === Shape.UnknownRenderer)
            root.preferredRendererType = Shape.CurveRenderer
    }
}
