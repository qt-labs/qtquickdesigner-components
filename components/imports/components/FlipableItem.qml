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

/*!
    \qmltype FlipableItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0

    \brief Provides a surface that can be flipped.

    A Flipable type can be visibly flipped between its front and back sides, like a card. The front
    and back sides are specified by using any two types inside the Flipable type. The type with the
    higher z-order is the front side. The \l opacityFront and \l opacityBack properties are used to
    hide and show either the front or back side of the item at a time.

    The \l flipAngle property is used to animate the angle of the type to produce the flipping
    effect. The value of the \l rotationalAxis property determines which axis the type is rotated
    around.

    \section2 Example Usage

    You can use the Flipable component in \QDS to create an item that can be flipped.

    \image studio-flipable.webp

    The QML code looks as follows:

    \code
    FlipableItem {
        id: flipable
        x: 595
        y: 277
        width: 493
        height: 493
        opacityFront: 1
        opacityBack: 0.09412
        flipAngle: 45
        rotationalAxis: 1

        TriangleItem {
            id: triangle
            x: 122
            y: 122
            width: 250
            height: 250
            opacity: 1
            z: 0
            strokeWidth: 10
            fillColor: "#6cff9f"
            rotation: -270
        }

        TriangleItem {
            id: triangle1
            x: 16
            y: 122
            width: 250
            height: 250
            strokeWidth: 10
            rotation: 270
            fillColor: "#6cff9f"
        }
    }
    \endcode
*/

Flipable {
    id: flipable
    width: 240
    height: 240

/*!
    The flip angle in degrees.

    The minimum value is -360 and the maximum value is 360 degrees.
*/
    property alias flipAngle: rotation.angle

/*!
    The opacity of the front side of the type.

    The opacity can be set between 0 and 1 to hide or show the items on the
    front side of the type.
*/
    property real opacityFront: 1

/*!
    The opacity of the back side of the type.

    The opacity can be set between 0 and 1 to hide or show the items on the
    back side of the type.
*/
    property real opacityBack: 1

/*!
    Whether the type is rotated around the x-axis or y-axis.

    This property is set to 0 to rotate the type around the x-axis or to
    1 to rotate around the y-axis.
*/
    property int rotationalAxis: 1 // 0: x-axis, 1: y-axis

    Binding {
        target: flipable.front
        value: opacityFront
        property: "opacity"
        when: flipable.front !== undefined
    }

    Binding {
        target: flipable.back
        value: opacityBack
        property: "opacity"
        when: flipable.back !== undefined
    }

/*!
    Whether the type has been flipped.

    This property is set to \c true when the type is flipped.
*/
    property bool flipped: false

    onChildrenChanged: {
        if (flipable.children[0] !== undefined && !flipable.front) {
            flipable.front = flipable.children[0]
        }

        if (flipable.children[1] !== undefined && !flipable.back){
            flipable.back = flipable.children[1]
        }
    }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: flipable.rotationalAxis === 0 ? 1 : 0
        axis.y: flipable.rotationalAxis === 1 ? 1 : 0
        axis.z: 0
        angle: 0    // the default angle
    }
}
