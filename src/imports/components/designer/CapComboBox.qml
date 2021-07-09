/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
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

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

ComboBox {
    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                   + StudioTheme.Values.actionIndicatorWidth
    width: implicitWidth
    model: ["FlatCap", "SquareCap", "RoundCap"]
    backendValue: backendValues.capStyle
    useInteger: true
    manualMapping: true

    property bool block: false

    onValueFromBackendChanged: fromBackendToFrontend()

    onCurrentTextChanged: {
        if (!__isCompleted)
            return

        if (block)
            return

        if (currentText === "FlatCap")
            backendValues.capStyle.value = 0

        if (currentText === "SquareCap")
            backendValues.capStyle.value = 16

        if (currentText === "RoundCap")
            backendValues.capStyle.value = 32
    }

    Connections {
        target: modelNodeBackend
        function onSelectionChanged() { fromBackendToFrontend() }
    }

    function fromBackendToFrontend()
    {
        if (!__isCompleted || backendValues.capStyle === undefined)
            return

        block = true

        if (backendValues.capStyle.value === 0)
            currentIndex = 0
        if (backendValues.capStyle.value === 16)
            currentIndex = 1
        if (backendValues.capStyle.value === 32)
            currentIndex = 2

        block = false
    }
}
