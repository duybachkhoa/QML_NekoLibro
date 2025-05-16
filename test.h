#ifndef TEST_H
#define TEST_H

#include <QObject>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);

    Q_INVOKABLE void sayHello();  // Hàm có thể gọi từ QML
    Q_INVOKABLE void sayBye();
};

#endif // TEST_H
