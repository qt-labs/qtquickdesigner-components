// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

pragma Singleton
import QtQuick 2.10

QtObject {
    readonly property int width: 1280
    readonly property int height: 720
    readonly property FontLoader mySystemFont: FontLoader { name: "Arial" }
    /* Edit this comment to add your custom font */
    /* readonly property FontLoader myCustomFont: FontLoader { source: "MyCustomFont.ttf" } */
    readonly property font font: Qt.font({
                                             family: mySystemFont.name,
                                             pointSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: mySystemFont.name,
                                                  pointSize: Qt.application.font.pixelSize * 1.6
                                              })
    readonly property color backgroundColor: "#c2c2c2"
}
