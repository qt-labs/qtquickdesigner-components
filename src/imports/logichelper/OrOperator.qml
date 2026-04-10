// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10

/*!
    \qmltype OrOperator
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Evaluates two boolean input values and provides the result as output.

    The OrOperator type evaluates two boolean inputs, \l input01 and \l input02.
    The \l output is evaluated as \c true if either \l input01 or \l input02 is
    evaluated as \c true.

    Designers can use the Or Operator type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use the checked state of two \l CheckBox
    types to determine the checked state of a third one:

    \code
    Rectangle {
        CheckBox {
            id: checkBox1
            text: qsTr("Check Box 1")
            checked: false
        }
        CheckBox {
            id: checkBox2
            text: qsTr("Check Box 2")
        }

        CheckBox {
            id: checkBox3
            text: qsTr("Check Box 3")
            checked: orOperator.output
        }

        OrOperator {
            id: orOperator
            input02: checkBox2.checked
            input01: checkBox1.checked
        }
    }
    \endcode

    \sa AndOperator, NotOperator
*/

QtObject {
    id: object

/*!
    The first value to evaluate.
*/
    property bool input01: false

/*!
    The second value to evaluate.
*/
    property bool input02: false

/*!
    The result of the evaluation.
*/
    property bool output: object.input01 || object.input02
}
