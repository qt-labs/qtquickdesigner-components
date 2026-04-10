// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12

QtObject {
    id: list
    property Item intialItem
    //has next prev and most likely currentIndex, count
    property var items

    property Item nextItem
    property Item prevItem

    property Item currentItem

    onCurrentItemChanged:  {

        var currentIndex = list.__indexForCurrentItem()

        if (currentIndex < (list.items.length - 1))
            list.nextItem = list.items[currentIndex + 1]
        if (currentIndex > 0)
            list.prevItem = list.items[currentIndex - 1]

    }

    function __indexForCurrentItem() {
        var currentIndex = -1
        for (var i = 0; i < list.items.length; ++i) {
            var item = list.items[i]
            if (item === list.currentItem)
                currentIndex = i
        }
        return currentIndex
    }

    property int length: items.length

    function next() {
        var currentIndex = list.__indexForCurrentItem()

        list.nextItem = null

        if (currentIndex > -1 && (currentIndex < list.items.length - 1)) {
            list.prevItem = list.items[currentIndex]
            list.currentItem = list.items[currentIndex + 1]
            if (currentIndex + 2 < list.items.length)
                list.nextItem = list.items[currentIndex + 2]
        }
    }

    function prev() {
        var currentIndex = list.__indexForCurrentItem()

        list.prevItem = null

        if (currentIndex > 0 && currentIndex < (list.items.length)) {
            if (currentIndex - 2 >= 0)
                list.prevItem = list.items[currentIndex - 2]
            list.currentItem = list.items[currentIndex - 1]

            list.nextItem = list.items[currentIndex]
        }
    }

    Component.onCompleted: {
        list.currentItem = list.intialItem
        var currentIndex = list.__indexForCurrentItem()
        if (currentIndex < (list.items.length - 1))
            list.nextItem = list.items[currentIndex + 1]
        if (currentIndex > 0)
            list.prevItem = list.items[currentIndex - 1]
    }
}
