////��ʽ����
#include <stdio.h>
//#include "DllTest.h"
#include <windows.h>

#pragma comment(lib, "DllTest.lib") //GCC��֧��
extern "C" int __declspec(dllimport) add(int, int);

int main()
{

    printf("id = %d\n",  add(1,2) );
    system("pause");
    return 0;
}

////��ʽ����1
//#include<stdio.h>
//#include<windows.h>
//
//typedef int(*lpAddFun)(int, int);       //�궨�庯��ָ������
//int main(int argc, char*argv[])
//{
//    HINSTANCE hDll;     //DLL���
//    lpAddFun addFun;    //����ָ��
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

////��ʽ����2
//#include <stdio.h>
//#include <windows.h>
//typedef int(*lpget_id)(void); //���庯������
//typedef int(*lpadd)(int, int); //���庯������
//
//int main()
//{
//	HINSTANCE hdll; //dll���
//	lpget_id get_id;
//	lpadd add;
//	hdll = LoadLibrary("dlltest.dll"); //���� dll
//	if (hdll != NULL)
//	{
//		get_id = (lpget_id)GetProcAddress(hdll, MAKEINTRESOURCE(2));
//		add = (lpadd)GetProcAddress(hdll, "add");//ͨ��ָ���ȡ��������
//		printf("id = %d\n", get_id());//���ú���
//		printf("id = %d\n", add(1, 2));//���ú���
//		FreeLibrary(hdll);//�ͷ�dll���
//	}
//	else
//	{
//		MessageBox(NULL, "����������", "��ʾ���ð�", MB_OK);
//		printf("error!!!code 001");
//	}
//
//	system("pause");
//	return 0;
//}
