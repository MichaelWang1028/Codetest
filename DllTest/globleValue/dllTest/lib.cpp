#include "lib.h"
#include <windows.h>

int dllGlobalVar;

///*DllMain如果没有，系统会默认一个，但是什么都不做*/
//BOOL APIENTRY DllMain(HANDLE hModule,
//	DWORD  ul_reason_for_call,
//	LPVOID lpReserved
//	)
//{
//	switch (ul_reason_for_call)
//	{
//	case DLL_PROCESS_ATTACH:
//		dllGlobalVar = 100;
//		break;
//	case DLL_THREAD_ATTACH:
//	case DLL_THREAD_DETACH:
//	case DLL_PROCESS_DETACH:
//		break;
//	}
//	return TRUE;
//}

int GetGlobalVar()
{
	return dllGlobalVar;
}