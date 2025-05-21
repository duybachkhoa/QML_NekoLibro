#ifndef DATABASE_H
#define DATABASE_H

#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlError>
#include <QtSql/QSqlQuery>
#include <QDebug>

class Database
{
public:
    Database();
    bool connectDatabase();
    void closeDatabase();
signals:
};

#endif // DATABASE_H
