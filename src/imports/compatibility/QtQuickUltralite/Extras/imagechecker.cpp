/******************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
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

#include "imagechecker.h"

#include <QImage>
#include <QQmlEngine>
#include <QQuickImageProvider>
#include <QQmlContext>

namespace {

QRgb getDominantColor(const QImage &image)
{
    QRgb color = 0;
    for (int y = 0; y < image.height(); ++y) {
        const auto *scanline = reinterpret_cast<const QRgb *>(image.scanLine(y));
        for (int x = 0; x < image.width(); ++x) {
            const auto c = scanline[x];
            if (qAlpha(c) > qAlpha(color))
                color = c;
        }
    }
    return qUnpremultiply(color) & 0x00ffffff;
}

bool isUsingOnlyDominantColor(const QImage &argb32, const QRgb color)
{
    const auto compare = [](int c1, int c2) -> bool { return qAbs(c1 - c2) <= 2; };

    for (int y = 0; y < argb32.height(); ++y) {
        const auto *scanline = reinterpret_cast<const QRgb *>(argb32.scanLine(y));
        for (int x = 0; x < argb32.width(); ++x) {
            const auto c = scanline[x];
            const auto premul = qPremultiply(color | (qAlpha(c) << 24));
            if (!compare(qRed(c), qRed(premul)) || !compare(qGreen(c), qGreen(premul))
                || !compare(qBlue(c), qBlue(premul))) {
                return false;
            }
        }
    }
    return true;
}

bool isAlpha8(const QImage &image)
{
    if (image.format() == QImage::Format_Alpha8) {
        return true;
    } else if (image.hasAlphaChannel()) {
        const auto argb32 = image.convertToFormat(QImage::Format_ARGB32_Premultiplied);
        const auto dominantColor = getDominantColor(argb32);

        return isUsingOnlyDominantColor(argb32, dominantColor);
    }
    return false;
}

} // namespace

ImageChecker::ImageChecker() = default;

ImageChecker *ImageChecker::getInstance()
{
    static ImageChecker *instance = new ImageChecker;
    return instance;
}

Q_INVOKABLE bool ImageChecker::isMonochrome(const QUrl &url)
{
    QImage image;

    const auto scheme = url.scheme();

    if (scheme == "image") {
        image = getImageFromProvider(url);
    } else if (scheme == "qrc") {
        const auto imageId = ":" + url.path();
        image.load(imageId);
    } else if (scheme == "file") {
        const auto imageId = url.path();
        image.load(imageId);
    } else {
        qDebug() << Q_FUNC_INFO << "ColorizedImage doesn't support url.scheme: " << scheme << ", for image: " << url;
    }

    return isAlpha8(image);
}

QImage ImageChecker::getImageFromProvider(const QUrl &url) const
{
    const auto *engine = QQmlEngine::contextForObject(this)->engine();
    auto *imageProvider = static_cast<QQuickImageProvider *>(engine->imageProvider(url.host()));
    QSize imageActualSize;
    QSize imageRequestedSize;
    const auto imageId = url.path().remove(0, 1);
    QImage image = imageProvider->requestImage(imageId, &imageActualSize, imageRequestedSize);
    if (image.isNull()) {
        image = imageProvider->requestPixmap(imageId, &imageActualSize, imageRequestedSize).toImage();
    }
    return image;
}
