#version 330

uniform float u_Time;

in vec3 a_Position;

void Sin2()
{
	vec4 newPosition;
	float centerX = a_Position.x + u_Time - 1.0;                      // u_Time=0일 때 -1에서 시작
	newPosition.x = centerX;
	newPosition.y = a_Position.y + sin((centerX + 1.0) * 3.14159265); // -1~1 구간에서 딱 한 주기
	newPosition.z = 0;
	newPosition.w = 1;

	gl_Position = newPosition;
}

void Circle1()
{
    vec4 newPosition;
    float radius = 1.0;                          // 원의 반지름
    float angle = u_Time;                        // 시간에 따라 각도 증가 (반시계)

    float centerX = cos(angle) * radius;         // u_Time=0일 때 cos(0)=1 → x=1 시작
    float centerY = sin(angle) * radius;         // u_Time=0일 때 sin(0)=0 → y=0 시작

    newPosition.x = a_Position.x + centerX;
    newPosition.y = a_Position.y + centerY;
    newPosition.z = 0;
    newPosition.w = 1;

    gl_Position = newPosition;
}

void sample()
{
    vec4 newPosition;
    newPosition.x = a_Position.x;
    newPosition.z = 0;
    newPosition.w = 1;

    // 상단 정점(y > 0)에만 파도 효과 적용, 하단(y == 0)은 고정
    if (a_Position.y > 0.0)
    {
        newPosition.y = a_Position.y + sin(a_Position.x * 3.14159265 + u_Time * 3.0) * 0.2;
    }
    else
    {
        newPosition.y = a_Position.y;
    }

    gl_Position = newPosition;
}
void main()
{
    sample();
}
