#include "restclient.h"

RestClient::RestClient(QObject * parent) : QObject(parent)
{    netManager = new QNetworkAccessManager(this);
     netReplay = nullptr;

     // estabelece a conexão entre o sinal de finalização e nosso slot que realiza a leitura do retorno
     connect(netManager,SIGNAL(finished(QNetworkReply*)),this,SLOT(readReply(QNetworkReply*)));
    // estabelece a conexão entre o sinal de finalização e nosso slot que realiza a leitura do retorno
   }

RestClient::~RestClient()
{



    //netManager->deleteLater();
    //headerData.clear();
}




void RestClient::makeRequest(QStringList param, QStringList valor)
{

   /* QString urlIni = "https://db.ygoprodeck.com/api/v7/cardinfo.php";//?name=A-Team:%20Trap%20Disposal%20Unit";
*/
 /*   QString parametros = "";
    for(int i = 0; i < param.length(); i++)
    {
        parametros += param[i]+"="+valor[i]+"&";
    }
*//*
    QNetworkRequest request;
    request.setUrl(QUrl(urlIni));
    //request.setHeader()
    qDebug() << request.url().toString();
    //this->netReplay =netManager->get(request);
    //netManager->
    netManager->get(request);
*/

    //readReply(this->netReplay);
 return;
}

void RestClient::readReply(QNetworkReply *reply)
{
    qDebug() << "entrou reay reply";
    //Cria um array de bytes para armazenar as informações
    QByteArray myData;
    //Lê todos os retornos do reply e armazena no array de bytes
    myData = reply->readAll();
    //qDebug() << myData;
    //qDebug() << reply->isFinished();
    //qDebug() << reply->error();

    //emite um sinal indicando que os dados já foram lidos e estão prontos para serem usados
   emit(dataReadyRead(myData));

    return;
}

/*void RestClient::slotError(QNetworkReply::NetworkError e)
{
    qDebug() << "slotError" << e ;
}*/
