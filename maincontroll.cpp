#include "maincontroll.h"

#include <ControllRequest.h>
#include <QFile>
#include <QStandardPaths>

MainControll::MainControll()
{
   QPointer<ConnectionSQL>  con = new ConnectionSQL();
   QList<QStringList> result = con->select("SELECT idexercicios, enunciado, resultado, professor.nome, materia.nome"
                " FROM exercicios"
                " INNER JOIN professor ON exercicios.fk_professor = professor.idprofessor"
                " INNER JOIN materia ON exercicios.fk_materia= materia.idmateria");

   QPointer<ControllerMaterias>  cm = new ControllerMaterias(con, &c_enun);
  // qDebug() << "Nome da matéria mainController: " <<cm->getMaterias()[0]->getNome();//getExercicios()[0]->getProfessor();
   // qDebug() << "Nome da matéria mainController: " <<cm->getMaterias()[0]->getExercicios().at(0)->getProfessor();

    const QUrl url(u"qrc:/MYuGiAiin/main.qml"_qs);



    this->rootContext()->setContextProperty("materias_est",cm);
   // this->rootContext()->setContextProperty("exercicios",&c2->getC_txt());
    this->rootContext()->setContextProperty("enchiridium",&c_enun);
    this->load(url);
    //Exercicio exerc;
   /* QString texto = "teste 3, eqweqwqwqw 5";//result[0][1];
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
    c_enun.setEnunciadoOnFront(lista_enviada);
    */
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
