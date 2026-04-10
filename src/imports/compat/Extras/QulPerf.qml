// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton

import QtQuick 2.12
//! [QulPerf compatibility]
//  Holds information about application performance.
//  This data is only available if Qt Quick Ultralite is compiled with QUL_ENABLE_PERFORMANCE_LOGGING.
//  Properties will be updated every two seconds.
//  All properties are read-only.
QtObject {
    readonly property bool enabled: false
    readonly property real fps: 0
    readonly property real imageBlend: 0
    readonly property real imageTransform: 0
    readonly property int maxDirtyNodes: 0
    readonly property real rectBlend: 0
    readonly property real rectFill: 0
    readonly property real rectRounded: 0
    readonly property real repaint: 0
    readonly property real textBlend: 0
    readonly property real textLayout: 0
}
//! [QulPerf compatibility]
