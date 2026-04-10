// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15

//! [SpriteLayer compatibility]
Item {
     enum ColorDepth {
         Bpp8, Bpp16, Bpp16Alpha, Bpp24, Bpp32, Bpp32Alpha
     }

    property int depth: ColorDepth.Bpp32
    property int platformId: 0
}
//! [SpriteLayer compatibility]
