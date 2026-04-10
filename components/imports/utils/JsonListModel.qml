// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR LGPL-3.0-only OR GPL-2.0-only OR GPL-3.0-only

import QtQml
import QtQml.Models as M
import QtQuick.Studio.Utils as U

M.ListModel {
    id: listModel

    property url source
    property var jsonObject
    dynamicRoles: true

    property U.FileReader fileReader: U.FileReader {
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
        var objectArray = JSON.parse(fileReader.content)
        listModel.jsonObject = fromLocalJson(objectArray)
        invalidateChildModels()
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
        for (let property in listModel) {
            let propertyValue = listModel[property]
            let propertyValueIsObject = propertyValue && typeof(propertyValue) === "object"

            if (propertyValueIsObject && propertyValue.jsonObject !== undefined)
                propertyValue.jsonObject = listModel.jsonObject
        }
    }

    Component.onCompleted: {
        updateJSON()
    }

// qmllint enable compiler
}
