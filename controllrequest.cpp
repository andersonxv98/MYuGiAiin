#include "controllrequest.h"

#include <qcoreapplication.h>



ControllRequest::ControllRequest(QObject *parent) : QObject(parent)
{
    RestClient * rc = new RestClient(this);
    this->cliente = rc;
    connect(cliente,&RestClient::dataReadyRead,this,&ControllRequest::setDataOnList);
}

void ControllRequest::disparaRequest(QStringList param, QStringList valor)
{    this->requestData(param, valor);
    return;
}

QList<QPointer<Carta> > ControllRequest::getLista()
{
return this->list_cards;
}

void ControllRequest::setDataOnList()
{
    QFile inFile("C:/Qt/Projetos/MyuGiAiin/dbcartas.json");

    inFile.open(QIODevice::ReadOnly|QIODevice::Text);

    QByteArray data = inFile.readAll();
    inFile.close();

    QJsonParseError errorPtr;
    QJsonDocument doc = QJsonDocument::fromJson(data, &errorPtr);
      if (doc.isNull()) {
          qDebug() << "Parse failed";
      }
      //qDebug() << doc;
      qDebug() << "OLHA O TAMANHO" << doc["data"].toArray().size();
   QJsonArray  repoInfo =  doc["data"].toArray();
            for(int i = 0; i < repoInfo.size(); i++)
                {
                //qDebug() << "entrou repeticao";
                QString nome = (repoInfo.at(i).toObject().value("name").toString());
                    qDebug() << nome;
                    QJsonArray url = (repoInfo.at(i).toObject().value("card_images").toArray());
                    QString url_st= url.at(0).toObject().value("image_url").toString();

                    QPointer<Carta> c = new Carta(nome, "white", url_st);
                    this->list_cards.push_back(c);


            }

        emit boleanTerminou(true);

         return;
}

void ControllRequest::resetList()
{

}

void ControllRequest::requestData(QStringList param, QStringList valor)
{
   // this->cliente->makeRequest(param, valor);
    return;
}
