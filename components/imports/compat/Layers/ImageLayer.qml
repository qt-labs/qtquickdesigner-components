// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15

//! [ImageLayer compatibility]
Item {
    enum RenderingHints {
         OptimizeForSpeed,
         OptimizeForSize,
         StaticContents
    }

    property int platformId: 0
    property int renderingHints: ImageLayer.RenderingHints.OptimizeForSpeed
    property alias source: internalImage.source

    Image {
        id: internalImage
        anchors.fill: parent
    }
}
//! [ImageLayer compatibility]
