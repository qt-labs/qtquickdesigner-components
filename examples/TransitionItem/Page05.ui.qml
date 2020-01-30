import QtQuick 2.12


/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
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

/*##^##
Designer {
    D{i:0;height:480;width:640}
}
##^##*/

