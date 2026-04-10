// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQml.Models as M
import QtQuick.Studio.Utils

M.ListModel {
    id: listModel

    property string modelName
    property var jsonObject: null

    dynamicRoles: true

// qmllint disable compiler

    onJsonObjectChanged: {
        listModel.clear()
        var objectArray = listModel.jsonObject
        if (modelName.modelName !== "")
            objectArray = objectArray[listModel.modelName]
        for (var key in objectArray) {
            var jo = objectArray[key]
            listModel.append(jo)
        }
    }
// qmllint enable compiler
}
