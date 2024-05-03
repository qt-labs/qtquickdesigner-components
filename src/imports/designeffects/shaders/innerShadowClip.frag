#version 440
layout(location = 0) in vec2 qt_TexCoord0;
layout(location = 0) out vec4 fragColor;
layout(std140, binding = 0) uniform buf {
    mat4 qt_Matrix;
    float qt_Opacity;
};
layout(binding = 1) uniform sampler2D shadow;
layout(binding = 2) uniform sampler2D original;

void main() {
    vec4 o = texture(original, qt_TexCoord0); // original

    if (o.a == 0)
        discard;

    vec4 s = texture(shadow, qt_TexCoord0); // shadow

    if (s.a == 0)
        discard;

    fragColor = s;
    //} else {
    //    fragColor.rgb = mix(s.rgb, o.rgb, (1.0 - s.a));
    //    fragColor.a = s.a + (o.a * (1.0 - s.a));
    //}
}
