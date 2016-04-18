#include <iostream>
#include "windows.h"
#include "circle.h"

typedef void(WINAPI *PCTOR) ();

int main(int argc, int *argv[])              ////如何动态载入dll中的类暂时未解决！！！！
{
	//HMODULE hMod = LoadLibrary("libTest.dll");
	//if (NULL == hMod)
	//{
	//	std::cout << "Load library failed" << std::endl;
	//	return FALSE;
	//}
	//
	//Circle *pCircle = (Circle *)malloc(sizeof(Circle));
	//if (NULL == pCircle)
	//{
	//	std::cout << "Memory allocatioin failed!" << std::endl;
	//	return FALSE;
	//}

	//PCTOR pCicle = (PCTOR)GetProcAddress(hMod, "Cicle");
	//if (NULL == pCicle)
	//{
	//	std::cout << "Get proc address failed!" << std::endl;
	//	return FALSE;
	//}



	Circle circle;
	Point point(3.34, 2.44);
	circle.SetCentre(point);
	circle.SetRadius(70.9);

	std::cout << "The erea is :" << circle.GetArea() << std::endl;
	std::cout << "The girth is : " << circle.GetGirth() << std::endl;

	system("pause");
	return 0;
}