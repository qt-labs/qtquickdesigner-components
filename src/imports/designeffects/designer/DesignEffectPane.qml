// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Layouts
import HelperWidgets
import StudioTheme as StudioTheme

PropertyEditorPane {
    id: itemPane

    ComponentSection {}

    DynamicPropertiesSection {
        propertiesModel: SelectionDynamicPropertiesModel {}
        visible: !hasMultiSelection
    }

    Column {
        anchors.left: parent.left
        anchors.right: parent.right

        Loader {
            id: specificsTwo

            property string theSource: specificQmlData

            anchors.left: parent.left
            anchors.right: parent.right
            visible: specificsTwo.theSource !== ""
            sourceComponent: specificQmlComponent

            onTheSourceChanged: {
                specificsTwo.active = false
                specificsTwo.active = true
            }
        }

        Loader {
            id: specificsOne
            anchors.left: parent.left
            anchors.right: parent.right
            source: specificsUrl
        }
    }
}
