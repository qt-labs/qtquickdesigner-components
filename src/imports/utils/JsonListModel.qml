/****************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Dialogs module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Studio.Utils
//import "jsonpath.js" as JSONPath

ListModel {
    id: listModel

    property url source
    property var jsonObject
    dynamicRoles: true

    property FileReader fileReader: FileReader {
        id: fileReader
        filePath: listModel.source
        onContentChanged: listModel.updateJSON()
    }

// qmllint disable compiler
    onJsonObjectChanged: {
        listModel.clear()
        var objectArray = listModel.jsonObject

        for (var key in objectArray) {
            var jo = objectArray[key]
            listModel.append(jo)
        }
    }

    function updateJSON() {
        if (fileReader.content === "")
            return

        var objectArray = parseJSONString(fileReader.content)
        listModel.jsonObject = fromLocalJson(objectArray)
        invalidateChildModels()
    }

    function parseJSONString(jsonString, object) {
        var objectArray = JSON.parse(jsonString)

        return objectArray
    }

    function isObject(obj) {
        return obj && obj.constructor === Object
    }

    function fromLocalJson(localJson) {
        if (!isObject(localJson))
            return {}

        var parsedModel = {}
        for (let collectionName in localJson) {
            let collection = localJson[collectionName]
            if (isObject(collection)) {
                if (Array.isArray(collection.columns) && Array.isArray(collection.data)) {
                    let propertyNames = []
                    let extractedCollection = []

                    for (let columnId in collection.columns) {
                        let column = collection.columns[columnId]
                        propertyNames.push(isObject(column) ? column.name : null)
                    }

                    for (let rowId in collection.data) {
                        let extractedElement = {}
                        let row = collection.data[rowId]
                        if (Array.isArray(row)) {
                            let maxIdx = Math.min(row.length, propertyNames.length)
                            for (let idx = 0; idx < maxIdx; ++idx) {
                                let propertyName = propertyNames[idx]
                                if (propertyName !== "") {
                                    let value = row[idx]
                                    if (value !== undefined && value !== null)
                                        extractedElement[propertyName] = value
                                }
                            }
                        }
                        extractedCollection.push(extractedElement)
                    }
                    parsedModel[collectionName] = extractedCollection
                }
            }
        }
        return parsedModel
    }

    function invalidateChildModels() {
        for(var property in listModel) {
            if (listModel[property].jsonObject !== undefined) {
                listModel[property].jsonObject = listModel.jsonObject
            }
        }

    }

    Component.onCompleted: {
        invalidateChildModels()
    }
// qmllint enable compiler
}
