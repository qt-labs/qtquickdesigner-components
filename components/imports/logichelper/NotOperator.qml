// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10

/*!
    \qmltype NotOperator
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Evaluates a boolean input value and provides the result as output.

    The NotOperator type evaluates the boolean input \l input. The \l output
    value is evaluated as \c true if \l input is evaluated as \c false.

    Designers can use the Not Operator type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use the checked state of a \l CheckBox to
    determine the checked state of another one:

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
            checked: notOperator.output
        }
        NotOperator {
            id: notOperator
            input: checkBox1.checked
        }
    }
    \endcode

    \sa AndOperator, OrOperator
*/

QtObject {
    id: object

/*!
    The value to evaluate.
*/
    property bool input: false

/*!
    The result of the evaluation.
*/
    property bool output: !object.input
}
