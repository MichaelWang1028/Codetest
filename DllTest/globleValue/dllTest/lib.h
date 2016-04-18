#ifndef LIB_H
#define LIB_H

#ifdef LIB_FILE
#define LIB_API int __declspec(dllimport)
#else
#define LIB_API int __declspec(dllexport)
#endif

extern "C" LIB_API dllGlobalVar;
extern "C" LIB_API GetGlobalVar();
#endif 