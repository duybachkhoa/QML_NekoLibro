#include "test.h"
#include <QDebug>

Test::Test(QObject *parent) : QObject(parent) {}

void Test::sayHello() {
    qDebug() << "Hello from C++!";
}
void Test::sayBye(){
    qDebug() << "Bye from C++!";
}
