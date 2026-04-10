// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

import TransitionItem 1.0
import FlowView 1.0
import QtQuick.Controls 2.3

FlowItem {
    id: page01
    width: 640
    height: 480

    PageTemplate {
        id: pageTemplate
        anchors.fill: parent

        Rectangle {
            id: rectangle
            x: 110
            y: 211
            width: 100
            height: 100
            color: "#323244"
            radius: 50
        }

        Rectangle {
            id: rectangle1
            x: 70
            y: 317
            width: 180
            height: 53
            color: "#323244"
        }

        Rectangle {
            id: rectangle2
            x: 45
            y: 387
            width: 230
            height: 19
            color: "#323244"
        }

        Rectangle {
            id: rectangle3
            x: 45
            y: 428
            width: 230
            height: 19
            color: "#323244"
        }

        Rectangle {
            id: rectangle4
            x: 413
            y: 211
            width: 100
            height: 100
            color: "#323244"
            radius: 50
        }

        Rectangle {
            id: rectangle5
            x: 373
            y: 317
            width: 180
            height: 53
            color: "#323244"
        }

        Rectangle {
            id: rectangle6
            x: 348
            y: 387
            width: 230
            height: 19
            color: "#323244"
        }

        Rectangle {
            id: rectangle7
            x: 348
            y: 428
            width: 230
            height: 19
            color: "#323244"
        }

        Rectangle {
            id: rectangle8
            x: 96
            y: 72
            width: 429
            height: 126
            color: "#9d9d9d"
        }
    }
}
