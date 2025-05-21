#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFile>
#include "login.h"
#include "database.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    Database db;
    db.connectDatabase();
    Login login;
    engine.rootContext()->setContextProperty("login", &login);
    engine.loadFromModule("qml_vs_cpp", "Main");
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
