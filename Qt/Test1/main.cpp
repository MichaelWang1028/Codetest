#include<QApplication>
#include<QDialog>
#include<QLabel>

int main(int argc, char*argv[])
{
    QApplication a(argc, argv);
    QDialog w;
    QLabel label(&w);
    label.setText("Hello World! 你好Qt!");
    w.show();

    return a.exec();
}
