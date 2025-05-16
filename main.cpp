#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFile>
#include "test.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Test testObj;
    engine.rootContext()->setContextProperty("testObj", &testObj);
    engine.loadFromModule("qml_vs_cpp", "Main");
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
