#include <stdio.h>
#include <wchar.h>
#include <locale.h>

int main()
{
	wchar_t c = L'��';			//L��ʾ���ַ�
	setlocale(LC_ALL, "Chs");
	wprintf(L"%lc\n", c);

	wchar_t str[] = L"����YYQ";		//���ַ�����
	wprintf(L"%ls\n", str, str[1]);

	return 0;
} 