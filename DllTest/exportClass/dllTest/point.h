/*******************circle.h :interface for the circle class**********************************************/


/*********************************************************************************************************/

#ifndef POINT_H
#define POINT_H

//#ifdef DLL_FILE
//class __declspec(dllexport) Point  //导出类point
//#else
//class __declspec(dllimport) Point //导入类 point
//#endif

#ifdef DLL_FILE
#define POINT_API __declspec(dllexport)
#else
#define POINT_API __declspec(dllimport)
#endif

class POINT_API Point
{
public:
	Point();
	Point(float x_coordiname, float y_coordiname);

private:
	float y;
	float x;
};

#endif //~POINT_H
