/****************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Ultralite compatibility.
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
import QtQuick.Shapes 1.12

//! [ArcItem compatibility]
Shape {
    id: root

    implicitWidth: 100
    implicitHeight: 100

    // These properties are not supported in Qt Quick Ultralite:
    // gradient, strokeStyle, dashPattern, dashOffset

    property alias strokeWidth: path.strokeWidth
    property alias strokeColor: path.strokeColor
    property alias joinStyle: path.joinStyle
    property alias fillColor: path.fillColor
    property alias capStyle: path.capStyle
    property real begin: 0
    property real end: 90
    property real arcWidth: 10
    property real alpha: root.clamp(root.sortedEnd() - root.sortedBegin(), 0, 359.9)

    // antialiasing is enabled to have the same shape as Qt Quick Ultralite runtime
    antialiasing: true

    layer.enabled: root.antialiasing
    layer.smooth: root.antialiasing
    layer.samples: root.antialiasing ? 4 : 0

    property bool outlineArc: false
    property bool round: false
    property bool roundEnd: root.round
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
        capStyle: ShapePath.FlatCap

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
        root.__wasFull = root.isArcFull()
        root.constructArcItem()
    }
}
//! [ArcItem compatibility]
