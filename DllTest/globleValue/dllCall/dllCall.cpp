#include <windows.h>
#include <stdio.h>
#ifndef LIB_FILE
#define LIB_FILE
#endif

#include "lib.h"


////#pragma comment(lib,"dllTest.lib")  //在配置连接器->输入-> 中已经载入
//extern "C" int _declspec(dllimport) GetGlobalVar();
////extern int dllGlobalVar;
//extern "C" int _declspec(dllimport) dllGlobalVar; //用_declspec(dllimport)导入可以直接使用，导入的就是全局变量

int main(int argc, char* argv[])
{
	printf("%d ", GetGlobalVar());

	//*(int *)dllGlobalVar = 1;
	dllGlobalVar = 1;
	//特别要注意的是这种方法导出的并不是变量本身,而是DLL中导出变量的指针,应用程序必
	//须通过强制指针转换来使用  

	printf("%d ", GetGlobalVar());
	system("pause");
	return 0;
}