#include <windows.h>

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPreInstance, PSTR szCmdLine, int iCmdShow)
{
	TCHAR *szContent = TEXT("Say ��ඣ�");
	static TCHAR szCaption[] = TEXT("FirstBlood");		//�ŵ���̬���������ջ

	MessageBox(NULL, szContent, szCaption, MB_ICONEXCLAMATION | MB_OKCANCEL | MB_DEFBUTTON2);
	return 0;
} 