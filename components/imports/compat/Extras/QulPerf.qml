/****************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Ultralite compatibility.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/
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
