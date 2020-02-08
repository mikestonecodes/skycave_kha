uniform sampler2D tex;

static float4 FragColor;
static float4 fragmentColor;
static float2 texCoord;

struct SPIRV_Cross_Input
{
    float4 fragmentColor : TEXCOORD0;
    float2 texCoord : TEXCOORD1;
};

struct SPIRV_Cross_Output
{
    float4 FragColor : COLOR0;
};

void frag_main()
{
    FragColor = float4(fragmentColor.xyz, tex2D(tex, texCoord).x * fragmentColor.w);
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    fragmentColor = stage_input.fragmentColor;
    texCoord = stage_input.texCoord;
    frag_main();
    SPIRV_Cross_Output stage_output;
    stage_output.FragColor = FragColor;
    return stage_output;
}
