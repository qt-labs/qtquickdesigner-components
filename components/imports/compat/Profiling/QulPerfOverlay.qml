/******************************************************************************
**
** Copyright (C) 2023 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Ultralite module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/

import QtQuick 2.15
import QtQuickUltralite.Extras

Column {
    id: root

    onVisibleChanged: {
        if (root.visible) {
            console.log("Benchmark Results:");
            console.log("Total frames:    ", QulPerf.totalFrames);
            console.log("Average fps:     ", QulPerf.averageFps.toFixed(2));
            console.log("Minimum fps:     ", QulPerf.minimumFps.toFixed(1));
            console.log("Max heap usage:  ", QulPerf.maxHeapUsage, "Bytes");
            console.log("Max stack usage: ", QulPerf.maxStackUsage, "Bytes");
            console.log("Average CPU load:", QulPerf.averageCpuLoad.toFixed(1), "%");
        }
    }

    Text {
        color: "#ffb6c1"
        text: "Total frames: " + QulPerf.totalFrames
    }

    Text {
        color: "#ffb6c1"
        text: "Average fps: " + QulPerf.averageFps.toFixed(2)
    }

    Text {
        color: "#ffb6c1"
        text: "Minimum fps: " + QulPerf.minimumFps.toFixed(1)
    }

    Text {
        color: "#ffb6c1"
        text: "Max heap usage: " + QulPerf.maxHeapUsage + " Bytes"
    }

    Text {
        color: "#ffb6c1"
        text: "Max stack usage: " + QulPerf.maxStackUsage + " Bytes"
    }

    Text {
        color: "#ffb6c1"
        text: "Average CPU load: " + QulPerf.averageCpuLoad.toFixed(1) + "%"
    }
}
