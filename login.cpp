#include "login.h"

Login::Login(QObject *parent)
    : QObject{parent}
{}

void Login::login(const QString &username, const QString &password) {
    if (username.isEmpty() || password.isEmpty()) {
        emit showMessage("Login", "Vui lòng điền đầy đủ thông tin.", "red", false);
        return;
    }
    QSqlQuery query;


    query.prepare("SELECT * FROM Users WHERE username = ? AND password = ?");
    query.addBindValue(username);
    query.addBindValue(password);

    if (query.exec() && query.next()) {
        emit showMessage("Login", "Đăng nhập thành công.", "green", true);
        return;
    }
    emit showMessage("Login", "Tài khoản hoặc mật khẩu không đúng.", "red", false);
}

void Login::createAccount(const QString &email, const QString &username, const QString &password, const QString &fullname) {
    if (email.isEmpty() || username.isEmpty() || password.isEmpty() || fullname.isEmpty()) {
        emit showMessage("Register", "Vui lòng không bỏ trống thông tin.", "red", false);
        return;
    }

    QSqlQuery query;
    query.prepare("SELECT * FROM Users WHERE username = ?");
    query.addBindValue(username);
    if (query.exec() && query.next()) {
        emit showMessage("Register", "Tên tài khoản đã tồn tại.", "red", false);
        return;
    }
    qDebug() << "Thêm " << username << " vào CSDL";
    query.prepare("INSERT INTO Users(username, password, email, fullname)"
                  "VALUES ( ?, ?, ?, ?)");
    query.addBindValue(username);
    query.addBindValue(password);
    query.addBindValue(email);
    query.addBindValue(fullname);
    if (query.exec())
        emit showMessage("Register", "", "green", true);
}
void Login::test(QObject *usernameField, QObject *passField) {
    QString password = passField->property("text").toString();
    QString username = usernameField->property("text").toString();
    if (username.isEmpty() || password.isEmpty()) {
        emit showMessage("Login", "Vui lòng điền đầy đủ thông tin.", "red", false);
        return;
    }
    QSqlQuery query;


    query.prepare("SELECT * FROM Users WHERE username = ? AND password = ?");
    query.addBindValue(username);
    query.addBindValue(password);

    if (query.exec() && query.next()) {
        emit showMessage("Login", "Đăng nhập thành công.", "green", true);
        return;
    }
    emit showMessage("Login", "Tài khoản hoặc mật khẩu không đúng.", "red", false);
}

