//
//  DefaultShader.metal
//  PonUtl
//
//  Created by Mikuro Xina on 2021/01/01.
//

#include <metal_stdlib>
using namespace metal;

struct Vertex {
    float3 pos;
};

struct Uniform {
    float2 screen_size;
};

struct Varying {
    float4 position [[position]];
    float3 color;
};

vertex Varying vertex_shader(
    uint id [[vertex_id]],
    constant Vertex *vert [[buffer(0)]],
    constant Uniform &uniform [[buffer(1)]]
) {
    float3 pos = vert[id].pos;
    
    Varying out{float4(pos, 1.0), float3((pos.xy + float2(1.0)) / 2.0, 0.7)};
    out.position.xy /= (uniform.screen_size / 2.0);
    return out;
}

fragment half4 fragment_shader(Varying vert [[stage_in]]) {
    return half4(half3(vert.color), 1.0);
}
