
/*******************circle.h :interface for the circle class**********************************************/

#ifndef CIRCLE_H
#define CIRCLE_H

#include "point.h"
//#ifdef DLL_FILE
//class __declspec(dllexport) Circle //导出类Circle
//#else
//class __declspec(dllimport) Circle //导入类 Circle
//#endif

#ifdef DLL_FILE
#define CICLE_API __declspec(dllexport)
#else
#define CICLE_API __declspec(dllimport)
#endif

class CICLE_API Circle
{
public:
	void SetCentre(const Point &centrePoint);
	void SetRadius(float r);
	float GetGirth();
	float GetArea();
	Circle();

private:
	float radius;
	Point centre;
};

#endif //~CIRCL_H