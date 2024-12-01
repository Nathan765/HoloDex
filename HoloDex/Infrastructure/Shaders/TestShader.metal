//
//  TestShader.metal
//  HoloDex
//
//  Created by Nathan Stéphant on 01/12/2024.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>

using namespace metal;

fragment float4 tintRedFragmentShader(
                                      texture2d<float> inputTexture [[texture(0)]],
                                      sampler inputSampler [[sampler(0)]],
                                      float2 texCoords [[stage_in]])
{
    // Récupère la couleur originale
    float4 color = inputTexture.sample(inputSampler, texCoords);
    
    // Ajoute une teinte rouge jusqu'à un maximum de 1.0
    color.r = min(color.r + 0.5, 1.0);
    
    return color;
}
