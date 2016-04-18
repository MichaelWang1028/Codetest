//#ifndef simple_h_included
//#define simple_h_included
//#ifdef build_dll
//#define dll_export __declspec(dllexport)
//#else
//#define dll_export __declspec(dllimport)
//#endif
//int dll_export get_id(void);
//int dll_export add(int, int);
//#endif // simple_h_included



/* ÎÄ¼þÃû£ºDllTest.h */
#ifndef DLL_TEST_H
#define DLL_TEST_H

extern "C"
{
    int __declspec(dllexport)add(int x, int y);
    int __declspec(dllexport)get_id(void);
}
#endif //~DLL_TEST_H
