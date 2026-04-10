// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.0
import FlowView 1.0
import QtQuick.Dialogs 1.1

FlowDecision {
    id: root


    property alias text: dialog.text

    function trigger() {
        dialog.open()
    }

    property MessageDialog dialog: MessageDialog {

        id: dialog

        //property QtObject yesTarget
        //property QtObject noTarget

        //modal: true

        //visible: false

        standardButtons: StandardButton.Yes | StandardButton.No

        onYes: {
            print("acc")
            print("yes")
            root.targets[0].trigger()
        }
        onNo: {
            root.targets[1].trigger()
        }

        Component.onCompleted: print(dialog.footer)

    }
}
