QT += quick\
    quickwidgets \
    widgets\
    core gui\
    charts\
    svg\
    network\
    core\
    sql\

CONFIG += console

SOURCES += \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/conecctionsql.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controlleranimation.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerarc.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllercarta.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllercustomtext.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerenunciado.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllergame.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerimagem.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controlleritem.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerkeys.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerlogin.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllermaterias.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllermodelsqml.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerrotation.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllersubitemdinamico.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllmarcadores.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllretanguloqml.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllswipeview.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/aluno.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/bullet.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/calculadora.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/carta.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/componente.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/componentecomposto.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/enemyhidegame.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/exercicio.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/logincredenciais.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/marcadores.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/marcararandomizada.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/materia.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/playergun.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/playerhidegame.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/score.cpp \
        ../BibliotecaQQuickWidgets/biblioteca/base/qml/menudragndrop.cpp \
        controllrequest.cpp \
        main.cpp \
        maincontroll.cpp \
        restclient.cpp \
        viewcontroll.cpp

resources.files = main.qml
resources.prefix = /$${TARGET}
RESOURCES += resources\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/CardsView.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/CardView.qml\
    dbcartas.json\
    teste.json\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/dragNDop.qml\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/btnOperadores.qml\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/enunciado.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/resolucao.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/menudragndrop.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/exercicioslistamateria.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/login.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/materiais.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/configmenu.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/hidegame.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/logo-anglo.png\

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/Arc.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/CardView.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/CardsView.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/arc0.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/arc2.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/arc3.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/btnOperadores.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/compoente1.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/component1.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/component2.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/componente1.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/componente2.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/configmenu.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/customlabel.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/dragNDop.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/exercicioslistamateria.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/hidegame.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/imagem.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/login.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/marcadores.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/materiais.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/menudragndrop.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/ponteiro.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/resolucao.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/retangulo.qml \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/Agula1/parteA.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/Agula1/parteC.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/Agula1/parteb.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/VUmeter.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/VUmeter2.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/agulha1.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/agulha2.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/agulhacortado.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/agulhacortado2.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/cleiton.jfif \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/colors.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/fundo.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/medidor.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/medidor2.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/olv/green.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/olv/lightgreen.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/olv/red.svg \
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/olv/yellow.svg\
    ../BibliotecaQQuickWidgets/biblioteca/base/svg/logo-anglo.png\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/botao.qml\
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/enunciado.qml \
    dbcartas.json\
    teste.json

HEADERS += \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/conecctionsql.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controlleranimation.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerarc.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllercarta.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllercustomtext.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerenunciado.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllergame.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerimagem.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controlleritem.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerkeys.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerlogin.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllermaterias.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllermodelsqml.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllerrotation.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllersubitemdinamico.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllmarcadores.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllretanguloqml.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/controllswipeview.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/aluno.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/bullet.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/calculadora.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/carta.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/componente.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/componentecomposto.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/enemyhidegame.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/exercicio.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/logincredenciais.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/marcadores.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/marcararandomizada.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/materia.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/playergun.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/playerhidegame.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/cplus/models/score.h \
    ../BibliotecaQQuickWidgets/biblioteca/base/qml/menudragndrop.h \
    controllrequest.h \
    maincontroll.h \
    restclient.h \
    viewcontroll.h

android: include(android_openssl-master/openssl.pri)
