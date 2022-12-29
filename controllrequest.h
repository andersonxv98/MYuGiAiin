#ifndef CONTROLLREQUEST_H
#define CONTROLLREQUEST_H

#include <QObject>
#include <RestClient.h>
#include <../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/carta.h>
#include "qjsonarray.h"
#include "qjsondocument.h"
#include "qjsonobject.h"
#include <QFile>
#include <QIODevice>
class ControllRequest : public QObject
{Q_OBJECT
public:
    ControllRequest(QObject *parent = nullptr);
    void disparaRequest(QStringList param, QStringList valor);
    QList<QPointer<Carta>> getLista();
    public

    slots:
        void setDataOnList();
        void resetList();
    signals:
        void sinal1(QString consulta,QVector<QString> param, QVector<QString> valor);
        void boleanTerminou(bool);

    private:
        RestClient *cliente;
        QList<QPointer<Carta>> list_cards;
        void requestData(QStringList param, QStringList valor);
};

#endif // CONTROLLREQUEST_H
