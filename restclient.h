#ifndef RESTCLIENT_H
#define RESTCLIENT_H

#include <QObject>
#include <QDebug>
//#include <QtNetwork/qnetworkaccessmanager.h>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QPointer>

class RestClient: public QObject
{
    Q_OBJECT

 public:
     RestClient(QObject *parent = nullptr);
     ~RestClient();
     // Define o usuário e senha da autenticação no header
     //void setAuth(QString usuario,QString palavraPasse);
     // Realiza a requisição
     void makeRequest(QStringList param, QStringList valor);
 private:
     QNetworkAccessManager * netManager;
     QNetworkReply * netReplay;
     QNetworkRequest request;
     QString headerData;

 public
     slots:
         // Slot que recebe o sinal de finalização da requisição
         void readReply(QNetworkReply *reply);
     //    void slotError(QNetworkReply::NetworkError e);

    signals:
         // Sinal que indica que os dados já estão prontos para serem lidos
         void dataReadyRead(QByteArray);

};

#endif // RESTCLIENT_H
