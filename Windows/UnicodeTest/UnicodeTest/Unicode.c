#include <stdio.h>
#include <wchar.h>
#include <locale.h>

int main()
{
	wchar_t c = L'爱';			//L表示宽字符
	setlocale(LC_ALL, "Chs");
	wprintf(L"%lc\n", c);

	wchar_t str[] = L"爱你YYQ";		//宽字符数组
	wprintf(L"%ls\n", str, str[1]);

	return 0;
} 