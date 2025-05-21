#include "database.h"

QSqlDatabase db;

Database::Database() {}

bool Database::connectDatabase() {
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("nekolibro.db");

    if (!db.open()){
        qDebug() << "Kết nối CSDL thất bại: " << db.lastError().text();
        return false;
    }
    qDebug() << "Kết nối CSDL thành công.";
    return true;
}

void Database::closeDatabase() {
    if (db.isOpen()) {
        db.close();
        qDebug() << "Ngắt kết nối CSDL";
    }
}

