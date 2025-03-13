#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;

    vec4 color;
};
layout(binding = 1) uniform sampler2D src;

void main() {
    vec4 p = texture(src, qt_TexCoord0);

    if (p.a == 0) // Otherwise background is affected
        discard;

    fragColor = color * qt_Opacity;
}
