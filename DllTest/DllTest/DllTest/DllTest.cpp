//#include "dlltest.h"
//
//int dll_export get_id(void)
//{
//	return 10;
//}
//int dll_export add(int x, int y)
//{
//	return x + y;
//}


/*lib.cpp */
#include "DllTest.h"
int add(int x, int y)
{
    return x + y;
}

int  get_id(void)
{
    return 10;
}
