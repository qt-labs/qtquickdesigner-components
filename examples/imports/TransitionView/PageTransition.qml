/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
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

import QtQuick 2.10
import TransitionItem 1.0

QtObject {
    id: root

    signal finished

    /* Those should be lists that allow a n*n mappings. */
    property Item from: null
    property Item to: null
    property int duration

    property var transitionView: Item {}

    property real progress: effect.progress

    function __start() {
        root.effect.start()
    }

    function __enable() {
        effect.enable()
    }

    function __reset(current, next) {
        root.effect.from = current
        root.effect.to = next
        root.effect.transitionView = root.transitionView

        root.effect.reset()
    }

    function __stop(current, next) {
        root.effect.stop()
    }

    function trigger() {
        if (root.from === null)
            return;
        if (root.to === null)
            return;

        if (root.from === transitionView.currentItem)
            transitionView.gotoPage(root)
    }

    property PageEffect effect: DefaultPageEffect {
        transitionView: transitionView

    }

    onEffectChanged: {
        root.effect.transitionView = root.transitionView
    }

    property Connections effectConnection: Connections {
        target: root.effect
        onFinished: root.finished
    }
}

