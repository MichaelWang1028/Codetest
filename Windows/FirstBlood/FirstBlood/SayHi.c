#include <windows.h>

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPreInstance, PSTR szCmdLine, int iCmdShow)
{
	TCHAR *szContent = TEXT("Say 哈喽！");
	static TCHAR szCaption[] = TEXT("FirstBlood");		//放到静态区域而不是栈

	MessageBox(NULL, szContent, szCaption, MB_ICONEXCLAMATION | MB_OKCANCEL | MB_DEFBUTTON2);
	return 0;
} 