#include <windows.h>
#include <stdio.h>
#ifndef LIB_FILE
#define LIB_FILE
#endif

#include "lib.h"


////#pragma comment(lib,"dllTest.lib")  //������������->����-> ���Ѿ�����
//extern "C" int _declspec(dllimport) GetGlobalVar();
////extern int dllGlobalVar;
//extern "C" int _declspec(dllimport) dllGlobalVar; //��_declspec(dllimport)�������ֱ��ʹ�ã�����ľ���ȫ�ֱ���

int main(int argc, char* argv[])
{
	printf("%d ", GetGlobalVar());

	//*(int *)dllGlobalVar = 1;
	dllGlobalVar = 1;
	//�ر�Ҫע��������ַ��������Ĳ����Ǳ�������,����DLL�е���������ָ��,Ӧ�ó����
	//��ͨ��ǿ��ָ��ת����ʹ��  

	printf("%d ", GetGlobalVar());
	system("pause");
	return 0;
}