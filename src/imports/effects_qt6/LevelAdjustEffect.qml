// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.12
import Qt5Compat.GraphicalEffects

LevelAdjust {
    id: levelAdjust

    property real gammaR: 1.0
    property real gammaG: 1.0
    property real gammaB: 1.0

    gamma: Qt.vector3d(levelAdjust.gammaR, levelAdjust.gammaG, levelAdjust.gammaG)
}
