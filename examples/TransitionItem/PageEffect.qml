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
    signal started
    function start() {
        if (root.duration === 0) {
            root.transitionView.__setupCurrentItem()
            return
        }

        /* We set the parents to the content items to apply effects */
        from.parent = transitionView.__fromContentItem
        to.parent = transitionView.__toContentItem

        root.started()
        anim.start()
    }

     function stop() {
         anim.complete()
     }

    property Item from
    property Item to

    property Item transitionView

    property alias duration: anim.duration
    property alias easing: anim.easing

    property PropertyAnimation __anim: PropertyAnimation {
        id: anim
        duration: 250
        loops: 1
        onStopped: {
            /* reset all typical properties */
            transitionView.__fromContentItem.opacity = 1
            transitionView.__fromContentItem.x = 0
            transitionView.__fromContentItem.y = 0
            transitionView.__fromContentItem.z = 0
            transitionView.__fromContentItem.scale = 1

            transitionView.__toContentItem.opacity = 1
            transitionView.__toContentItem.x = 0
            transitionView.__toContentItem.y = 0
            transitionView.__toContentItem.z = 0
            transitionView.__toContentItem.scale = 1

            root.finished()
            root.transitionView.__setupCurrentItem()
        }
    }

}
