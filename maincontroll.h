#ifndef MAINCONTROLL_H
#define MAINCONTROLL_H

#include <QQmlApplicationEngine>
#include "ControllRequest.h"
#include "qqmlcontext.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllretanguloqml.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllswipeview.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerenunciado.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/conecctionsql.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllermaterias.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerlogin.h"
#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllergame.h"
//#include "../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/playerhidegame.h"
#include <QDebug>
class MainControll : public QQmlApplicationEngine
{
public:
    MainControll();


    //void testing();

private:
    ControllSwipeView c_swv;
    ControllRequest * ctrl;
    ControllerExercicio * c_enun;

};

#endif // MAINCONTROLL_H
