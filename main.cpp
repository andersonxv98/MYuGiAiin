#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "maincontroll.h"
#include <QSslSocket>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    MainControll engine;


    return app.exec();
}
