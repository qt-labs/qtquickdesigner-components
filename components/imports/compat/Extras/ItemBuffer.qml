// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
//! [ItemBuffer compatibility]
Item {
    enum ExtraFlag { RedrawItemBufferFlag = 1 }
//    property Transform transform; //in regular QML this property is already provided by QtQuick.Item
    property bool useAlphaChannel;
}
//! [ItemBuffer compatibility]
