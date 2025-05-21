#ifndef LOGIN_H
#define LOGIN_H

#include <QObject>
#include <QString>
#include <QtSql/QSql>
#include <QtSql/QSqlQuery>


class Login : public QObject
{
    Q_OBJECT
public:
    explicit Login(QObject *parent = nullptr);
public slots:
    void login(const QString &username, const QString &password);
    void createAccount(const QString &email, const QString &username, const QString &password, const QString &fullname);
signals:
    void showMessage( const QString &page, const QString &message, const QString &color, bool isSuccess);
};

#endif // LOGIN_H
