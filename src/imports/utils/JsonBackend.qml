// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQuick
import QtQuick.Studio.Utils

QtObject {
    id: server
    property url source

    property FileReader fileReader: FileReader {
        id: fileReader
        filePath: server.source
        onContentChanged: server.updateJSON()
    }

// qmllint disable compiler
    function updateJSON() {

        if (fileReader.content === "")
            return

        var objectArray = parseJSONString(fileReader.content)
        for (var key in objectArray) {
            var jo = objectArray[key]
            if (server[key] !== undefined)
                server[key] = jo
            else
                console.warn(key, "undefined")

        }
    }

    function parseJSONString(jsonString) {
        var objectArray = JSON.parse(jsonString)
        if (!objectArray)
            console.error("JSON parsing failed")

        return objectArray
    }
// qmllint enable compiler
}
