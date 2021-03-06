uniform float4 gl_HalfPixel;
uniform float4x4 projectionMatrix;

static float4 gl_Position;
static float3 vertexPosition;
static float2 texCoord;
static float2 texPosition;
static float4 color;
static float4 vertexColor;

struct SPIRV_Cross_Input
{
    float2 texPosition : TEXCOORD0;
    float4 vertexColor : TEXCOORD1;
    float3 vertexPosition : TEXCOORD2;
};

struct SPIRV_Cross_Output
{
    float4 color : TEXCOORD0;
    float2 texCoord : TEXCOORD1;
    float4 gl_Position : POSITION;
};

void vert_main()
{
    gl_Position = mul(float4(vertexPosition, 1.0f), projectionMatrix);
    texCoord = texPosition;
    color = vertexColor;
    gl_Position.x = gl_Position.x - gl_HalfPixel.x * gl_Position.w;
    gl_Position.y = gl_Position.y + gl_HalfPixel.y * gl_Position.w;
    gl_Position.z = (gl_Position.z + gl_Position.w) * 0.5;
}

SPIRV_Cross_Output main(SPIRV_Cross_Input stage_input)
{
    vertexPosition = stage_input.vertexPosition;
    texPosition = stage_input.texPosition;
    vertexColor = stage_input.vertexColor;
    vert_main();
    SPIRV_Cross_Output stage_output;
    stage_output.gl_Position = gl_Position;
    stage_output.texCoord = texCoord;
    stage_output.color = color;
    return stage_output;
}
