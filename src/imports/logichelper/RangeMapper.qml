// Copyright (C) 2026 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.10

/*!
    \qmltype RangeMapper
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Maps a numerical range to another range, so that the output value
    of the second range follows that of the original range.

    The minimum and maximum input and output values are specified as values of
    the \l inputMinimum, \l inputMaximum, \l outputMinimum, and \l outputMaximum properties.
    The original value is specified as the value of the \l output property.

    For example, if you map input in the range of \c {-1,1} to output in the
    range of \c {0,1000}, and the original value changes from -1 to 1, the
    output value will change from 0 to 1000. This is useful when remapping
    the current frame on the timeline, for example.

    Designers can use the Range Mapper type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use a RangeMapper type to map the value range
    from -1 to 1 that is specified for a \l Slider type to a range from 10 to
    1000:

    \code
    Rectangle {
        Slider {
            id: slider
            from: -1
            to: 1
            value: -1
        }
        RangeMapper {
            id: rangeMapper
            outputMinimum: 10
            outputMaximum: 1000
            inputMinimum: slider.from
            inputMaximum: slider.to
            input: slider.value
        }
    }
    \endcode
*/

QtObject {
    id: object

/*!
    The input value.
*/
    property real input: 0

/*!
    The output value.
*/
    property real output: {
        var slope = (object.outputMaximum - object.outputMinimum) / (object.inputMaximum - object.inputMinimum)
        return object.outputMinimum + slope * (object.input - object.inputMinimum)
    }

/*!
    The minimum input value.
*/
    property real inputMinimum: 0

/*!
    The maximum input value.
*/
    property real inputMaximum: 100

/*!
    The minimum output value.
*/
    property real outputMinimum: 0

/*!
    The maximum output value.
*/
    property real outputMaximum: 100

}
