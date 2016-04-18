#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::Widget)
{
    MyDidalog* dlg = new widget(this);
    connect(dlg, SIGNAL(dlgRetrun(int)),this,SLOT(showValue(int)));
    dlg->show();
    ui->setupUi(this);
}

Widget::~Widget()
{
    delete ui;
}

void Widget::on_pushButton_clicked()
{
    int value = ui->spinBox->value();//获取输入的值
    emit dlgRetrun(value);//发射信号
    close();//关闭对话框
}
