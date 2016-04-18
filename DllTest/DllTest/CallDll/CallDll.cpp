////隐式调用
#include <stdio.h>
//#include "DllTest.h"
#include <windows.h>

#pragma comment(lib, "DllTest.lib") //GCC不支持
extern "C" int __declspec(dllimport) add(int, int);

int main()
{

    printf("id = %d\n",  add(1,2) );
    system("pause");
    return 0;
}

////显式调用1
//#include<stdio.h>
//#include<windows.h>
//
//typedef int(*lpAddFun)(int, int);       //宏定义函数指针类型
//int main(int argc, char*argv[])
//{
//    HINSTANCE hDll;     //DLL句柄
//    lpAddFun addFun;    //函数指针
//    hDll = LoadLibrary("DllTest.dll");
//
//    if(hDll != NULL)
//    {
//        addFun = (lpAddFun)GetProcAddress(hDll, "add");
//        if(addFun != NULL)
//
//        {
//        int result = addFun(2, 3);
//        printf("%d", result);
//        }
//        FreeLibrary(hDll);
//    }
//    else
//    {
//        printf("error!!!code 001");
//    }
//
//    system("pause");
//    return 0;
//
//}

////显式调用2
//#include <stdio.h>
//#include <windows.h>
//typedef int(*lpget_id)(void); //定义函数类型
//typedef int(*lpadd)(int, int); //定义函数类型
//
//int main()
//{
//	HINSTANCE hdll; //dll句柄
//	lpget_id get_id;
//	lpadd add;
//	hdll = LoadLibrary("dlltest.dll"); //加载 dll
//	if (hdll != NULL)
//	{
//		get_id = (lpget_id)GetProcAddress(hdll, MAKEINTRESOURCE(2));
//		add = (lpadd)GetProcAddress(hdll, "add");//通过指针获取函数方法
//		printf("id = %d\n", get_id());//调用函数
//		printf("id = %d\n", add(1, 2));//调用函数
//		FreeLibrary(hdll);//释放dll句柄
//	}
//	else
//	{
//		MessageBox(NULL, "错误，吓尿你", "提示你妹啊", MB_OK);
//		printf("error!!!code 001");
//	}
//
//	system("pause");
//	return 0;
//}
