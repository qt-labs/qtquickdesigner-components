// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
//! [AnimatedSpriteDirectory compatibility]
//  Draws a sprite animation stored in a directory.
Item {
    property int currentFrame: 0
    property int frameDuration: 0
    property int loops: -1 //-1 = AnimatedSpriteDirectory.Infinite
    property bool running: true
    property bool paused: false
    property string sourcePath

    signal finished

    function advance() {}
    function pause() {}
    function restart() {}
    function resume() {}
    function start() {}
    function stop() {}
}
//! [AnimatedSpriteDirectory compatibility]
