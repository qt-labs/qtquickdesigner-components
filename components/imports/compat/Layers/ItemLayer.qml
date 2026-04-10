// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15

//! [ItemLayer compatibility]
Item {
    enum ColorDepth {
        Bpp16, Bpp16Alpha, Bpp24, Bpp32, Bpp32Alpha
    }

    enum RenderingHints {
        OptimizeForSpeed,
        OptimizeForSize,
        StaticContents
    }

    property int depth: ColorDepth.Bpp32
    property int refreshInterval: 1
    property int platformId: 0
    property int renderingHints: RenderingHints.OptimizeForSpeed
}
//! [ItemLayer compatibility]
