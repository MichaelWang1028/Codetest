
#include<windows.h>

LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPreInstance, PSTR szCmdLine, int iCmdShow)
{
	static TCHAR szAppName[] = TEXT("MyWindows");				//���崰���������
	HWND hwnd;													//���ڵľ���������ָ��
	MSG msg;													//��Ϣ�ṹ��Windows�ĺ��Ļ��ƾ�����Ϣ����
	WNDCLASS wndclass;
	wndclass.style = CS_HREDRAW | CS_VREDRAW;					//���»��Ƶ�
	wndclass.lpfnWndProc = WndProc;								//ָ�����ڹ��̣������ǻص�������
	wndclass.cbClsExtra = 0;
	wndclass.cbWndExtra = 0;
	wndclass.hInstance = hInstance;								//ʵ�����
	wndclass.hIcon = LoadIcon(NULL, IDI_APPLICATION);			//ͼ��
	wndclass.hCursor = LoadCursor(NULL, IDC_ARROW);				//���
	wndclass.hbrBackground = (HBRUSH)GetStockObject(GRAY_BRUSH);	 //��ɫ����
	wndclass.lpszMenuName = NULL;								//�˵���
	wndclass.lpszClassName = szAppName;							//����������

	if (!RegisterClass(&wndclass))								//ע�ᣬ����ָ��
	{ 
		MessageBox(NULL, TEXT("���������Ҫ��Windows NT������"), szAppName, MB_ICONERROR);
		return 0;
	}
	/*�������ɴ��ڵľ�������*/ //�����˴���ʵ������ʱ���д��ھ��
	hwnd = CreateWindow(szAppName,
		TEXT("��"),
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

	while (GetMessage(&msg, NULL, 0, 0))//��Ϣѭ������windows�ĺ���
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
