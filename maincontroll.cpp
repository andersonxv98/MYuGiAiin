#include "maincontroll.h"

#include <ControllRequest.h>
#include <QFile>
#include <QStandardPaths>

MainControll::MainControll()
{
    ConnectionSQL * con = new ConnectionSQL();
    con->select("SELECT * FROM aluno");
      //ctrl  = new ControllRequest();
    const QUrl url(u"qrc:/MYuGiAiin/main.qml"_qs);
    /*QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    */


    //this->rootContext()->setContextProperty("swControll", &c_swv);
    //this->rootContext()->setContextProperty("c1",&c->getC_txt());
    //this->rootContext()->setContextProperty("c2",&c2->getC_txt());
    this->rootContext()->setContextProperty("enchiridium",&c_enun);
    this->load(url);
    QString texto = "gastou 2 horas percorrendo uma distância de 120 km. Que velocidade Andisu estava em seu passeio? passei a 5";
    QStringList text_enun = texto.split(" ");
    QList<QStringList> lista_enviada;
    for(const QString &palavra: text_enun){
        QString tipo = "false";
        if(palavra.toDouble()){
            qDebug() << "CONVERTE: " << palavra;
            tipo = palavra;
        }
        lista_enviada.append({palavra+" ", tipo});

    }
    //c_enun.addOnArrastable(){})
    c_enun.setEnunciado(lista_enviada);
    //ctrl->setDataOnList();
    //connect(ctrl, &ControllRequest::boleanTerminou, this, &MainControll::trudShow);
    /*QPointer<Carta>   c = new  Carta("NOME QUALQUER", "purple", "https://images.ygoprodeck.com/images/cards/6983839.jpg");
     QPointer<Carta>   c2 = new  Carta("c2", "green", "https://images.ygoprodeck.com/images/cards/98927491.jpg");
    this->c_swv.appendItem(c);
     this->c_swv.appendItem(c2);*/
    //this->testing();

}

void MainControll::testing()
{


    qDebug() << "entrou ttestinsf";
    QList<QPointer<Carta>> ll= ctrl->getLista();


    for(QPointer<Carta> card: ll ){
        this->c_swv.appendItem(card);

    }

    for(int i =0; i <3; i++){
        c_swv.setNext();
    }
}
