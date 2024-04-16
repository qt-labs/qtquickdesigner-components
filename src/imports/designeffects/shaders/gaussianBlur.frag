#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    float blurKernel;
    float sigma;
    vec2 pixelSize;
    int useOffscreenColor; // bool
    vec4 offscreenColor;
};
layout(binding = 1) uniform sampler2D src;

const float PI = 3.14159265359;
const float sqrtDoublePI = sqrt(2.0 * PI);

vec4 gaussianBlur(sampler2D tex, int miplevel) {
    vec4 col = vec4(0.0);

    float sum = 0;

    float k = ceil(blurKernel);

    // Normalize kernel weights
    for (float i = -k; i <= k; ++i) {
        sum += exp(-0.5 * pow(i / sigma, 2.0)) / (sqrtDoublePI * sigma);
    }

    for (float i = -k; i <= k; ++i) {
        vec2 coord = qt_TexCoord0 + (pixelSize * float(i));
        float weight = exp(-0.5 * pow(i / sigma, 2.0)) / (sqrtDoublePI * sigma);

        if (useOffscreenColor != 0
            && (coord.x > 1.0 || coord.y > 1.0
                || coord.x < 0.0 || coord.y < 0.0)) {
            col += offscreenColor * weight / sum;
        } else {
            col += texture(tex, coord) * weight / sum;
        }
    }

    return col;
}

void main() {
    vec4 p = (blurKernel > 0) ? gaussianBlur(src, 0)
                              : texture(src, qt_TexCoord0);

    fragColor = p * qt_Opacity;
}
