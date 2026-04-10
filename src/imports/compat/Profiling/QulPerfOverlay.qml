// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial

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
