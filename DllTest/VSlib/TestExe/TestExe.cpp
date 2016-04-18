#include <stdio.h>
#include "lib.h"
#include "windows.h"
//#pragma comment(lib, "..\\debug\\libTest.a")//指定与静态库一起链接

int main(int argc, char*argv[])
{
	printf("2 + 3 = %d", add(2, 3));
	system("pause");
}