/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
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

import QtQuick 2.10

QtObject {
    id: object
    property QtObject target01
    property QtObject target02

    property string property01
    property string property02

    property QtObject __internal: QtObject {
        property variant value01
        property variant value02

        property bool block: false

        onValue01Changed: {
            if (__internal.block)
                return;

            __internal.block = true;
            object.target02[property02] =  __internal.value01
            __internal.block = false;
        }

        onValue02Changed: {
            if (__internal.block)
                return;

            __internal.block = true;
            object.target01[property01] =  __internal.value02
            __internal.block = false;
        }
    }

    property Binding __b01: Binding {
        target: __internal
        property: "value01"
        value: target01[property01]
    }

    property Binding __b02: Binding {
        target: __internal
        property: "value02"
        value: target02[property02]
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
