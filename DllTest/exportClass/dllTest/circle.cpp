#ifndef DLL_FILE
#define DLL_FILE
#endif

#include "circle.h"
#define PI 3.1415926

Circle::Circle()
{
	centre = Point(0, 0);
	radius = 0;
}

float Circle::GetArea()
{
	return PI*radius*radius;
}

float Circle::GetGirth()
{
	return 2 * PI*radius;
}

void Circle::SetCentre(const Point &centrePoint)
{
	centre = centrePoint;
}

void Circle::SetRadius(float r)
{
	radius = r;
}