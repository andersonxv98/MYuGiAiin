#include "maincontroll.h"

#include <ControllRequest.h>
#include <QFile>
#include <QStandardPaths>

MainControll::MainControll()
{
     MarcaraRandomizada * mask = new MarcaraRandomizada();
     ControllerGame * game_control = new ControllerGame(this->rootContext());

    c_enun = new ControllerExercicio(mask);
   QPointer<ConnectionSQL>  con = new ConnectionSQL();

   QPointer<ControllerMaterias>  cm = new ControllerMaterias(con, c_enun, mask);
    //c_enun.setMascaraRandomizada(cm->getMask());

    const QUrl url(u"qrc:/MYuGiAiin/main.qml"_qs);
    this->rootContext()->setContextProperty("login",cm->getCtrl_aluno());
    this->rootContext()->setContextProperty("materias_est",cm);
    this->rootContext()->setContextProperty("enchiridium",c_enun);
    this->rootContext()->setContextProperty("gamecontrol", game_control);

    this->load(url);


}

/*void MainControll::testing()
{


    qDebug() << "entrou ttestinsf";
    QList<QPointer<Carta>> ll= ctrl->getLista();


    for(QPointer<Carta> card: ll ){
        this->c_swv.appendItem(card);

    }

    for(int i =0; i <3; i++){
        c_swv.setNext();
    }
}*/
