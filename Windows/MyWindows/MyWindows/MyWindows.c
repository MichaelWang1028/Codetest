
#include<windows.h>

LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPreInstance, PSTR szCmdLine, int iCmdShow)
{
	static TCHAR szAppName[] = TEXT("MyWindows");				//定义窗口类的名字
	HWND hwnd;													//窗口的句柄，特殊的指针
	MSG msg;													//消息结构，Windows的核心机制就是消息机制
	WNDCLASS wndclass;
	wndclass.style = CS_HREDRAW | CS_VREDRAW;					//重新绘制等
	wndclass.lpfnWndProc = WndProc;								//指定窗口过程（必须是回调函数）
	wndclass.cbClsExtra = 0;
	wndclass.cbWndExtra = 0;
	wndclass.hInstance = hInstance;								//实例句柄
	wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);			//图标
	wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);				//光标
	wndclass.hbrBackground = (HBRUSH)GetStockObject(GRAY_BRUSH);	 //灰色背景
	wndclass.lpszMenuName = NULL;								//菜单栏
	wndclass.lpszClassName = szAppName;							//窗口类名字

	if (!RegisterClass(&wndclass))								//注册，传入指针
	{ 
		MessageBox(NULL, TEXT("这个程序需要在Windows NT上运行"), szAppName, MB_ICONERROR);
		return 0;
	}
	/*设置生成窗口的具体特征*/ //创建了窗口实例，此时就有窗口句柄
	hwnd = CreateWindow(szAppName,
		TEXT("鱼"),
		WS_OVERLAPPEDWINDOW,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		CW_USEDEFAULT,
		NULL,
		NULL,
		hInstance,
		NULL);

	ShowWindow(hwnd, iCmdShow); 
	UpdateWindow(hwnd);

	while (GetMessage(&msg, NULL, 0, 0))//消息循环——windows的核心
	{
		TranslateMessage(&msg);
		DispatchMessage(&msg);
	}

	return msg.wParam;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	HDC hdc;
	RECT rect;
	PAINTSTRUCT ps;

	switch (message)
	{
	case WM_PAINT:
		hdc = BeginPaint(hwnd, &ps);
		GetClientRect(hwnd, &rect);
		DrawText(hdc, TEXT("Hellow"), -1, &rect,
			DT_SINGLELINE | DT_CENTER | DT_VCENTER);
		EndPaint(hwnd, &ps);
		return 0;
	case WM_DESTROY:
		PostQuitMessage(0);
		return 0;
	}
	return DefWindowProc(hwnd, message, wParam, lParam);

}
