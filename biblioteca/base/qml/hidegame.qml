import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent
    property double velocidade: 1
    property double gravidade: 9.81
    property double forca: 10
    property bool colidiu: false
    property double massa: 60.1
    property double aceleracao: 0.1
    property int enemy_count: 0
    property int  enemy_maxQtdInRespaw: 5
    property int bulletId: 0;
    property int enemyId: 0;
    property int aux_fi: 1
    Text {
        id: dificultyId
        text: qsTr("Dificulty::")
        anchors.top: parent.top
        anchors.right:  enemyScoreKilled.left
        font.pointSize: 30
    }
    Text {
        id: enemyScoreKilled
        text: qsTr("enemiesKilled:")
        anchors.top: parent.top
        anchors.right:  score.left
        font.pointSize: 30
    }
    Text {
        id: score
        text: qsTr("Score:")
        anchors.top: parent.top
        anchors.right:  parent.right
        font.pointSize: 30
        color: "green"
        ColorAnimation on color {
            id: scoreAnimation
            from: "yellow"
            to: "black"
            duration: 200
            //loops: Animation.Infinite
        }
    }

    Rectangle {
        id: statusPlayerUi
        width: parent.width * 0.3
         height: parent.height  * 0.15
        anchors.top: parent.top
        anchors.left: parent.left
        color: "purple"
        ProgressBar {
            id: healtPlayerUi
            width: parent.width
            height: parent.height / 2
            anchors.top: parent.top
            value: 1;
            ///anchors.left: parent.left
            //color: "green"
            //border.color: "white"
            //border.width: 5
            Text {
                id: displayHealt
                text: playerControl.getHealt()
                font.pointSize: 20
            }
            Text {
                id: displayMaxHealt
                text: playerControl.getMaxHealt()
                font.pointSize: 20
                anchors.left: displayHealt.right
                anchors.leftMargin: 10
            }

        }
        Rectangle{
            id: ammoPlayerUi
            width: parent.width * 0.5
             height: parent.height  / 2
            anchors.top: healtPlayerUi.bottom
            ///anchors.left: parent.left
            color: "yellow"
            border.color: "white"
            border.width: 5
            Text {
                id: displayAmmo
                text: playerControl.getAmmoQtd()
                font.pointSize: 20
            }
            Text {
                id: displayMaxAmmo
                text: playerControl.getAmmoMax()
                font.pointSize: 20
                anchors.left: displayAmmo.right
                anchors.leftMargin: 10
            }
        }
        Rectangle{
            id: weaponPlayerUi
            width: parent.width * 0.5
             height: parent.height  / 2
            anchors.top: healtPlayerUi.bottom
            anchors.left: ammoPlayerUi.right
            color: "orange"
            border.color: "white"
            border.width: 5
        }

    }
    Component.onCompleted: {
        forceActiveFocus()
        //teste.target :
    }


     Text { id: time }

    Rectangle{
        id: screenGame
        width: parent.width
        height: parent.height * 0.8
        color: "gray"
        anchors.top: statusPlayerUi.bottom
        //x: parent.width * 0.2 / 2
        //y: parent.height * 0.2 / 2
        //border.color: "black"
        //border.width: 50
        /*MouseArea{
            id: idmArea
            anchors.fill:  parent
        }*/
        Timer {
                interval: 1000; running: true; repeat: true
                onTriggered: {
                    var aux  = enemy_maxQtdInRespaw;
                    while(enemy_maxQtdInRespaw){
                        createEnemyObject();
                        enemy_maxQtdInRespaw--;
                    }
                    enemy_maxQtdInRespaw = aux;
                    //enemy_maxQtdInRespaw += 1;
                    }
            }
        Rectangle{
            id: jogador
            width: 50
            height: 50
            color: "red"
            y: screenGame.height - height
            Component.onCompleted: {
                playerControl.setObj(jogador);
            }

        }




    }

    Connections{
        //id: teste
        target: gamecontrol

        function onSingleShooting(velo, dmg, comportamento, idbullet){
            Qt.createQmlObject(`
               import QtQuick 2.0

                Rectangle {
                    id: id${bulletId}
                   property int posX: jogador.x + jogador.width
                    property int posY: jogador.y + (jogador.height/4)
                   color: "white"
                   width: 20
                   height: 20
                   x: posX
                   y: posY

                   Component.onCompleted: {
                               aux_fi = 1;
                               gamecontrol.appendBullet(parent, ${bulletId}, "")
                               bullet${bulletId}.setWidth(width);
                               bullet${bulletId}.setHeight(height);

                   }
                   Timer {

                           interval: 5; running: true; repeat: true
                           onTriggered: {
                                comportamentoMovimentoBullet( "${comportamento}"+"Circle", parent, bullet${bulletId}, ${velo})
                                comportamentoBulletColision(parent, gamecontrol, scoreControl, screenGame)
                           }
                       }

                Connections{

                            target: bullet${bulletId}

                               }

               }
               `,
               screenGame);
        }

        function onDoubleShooting(velo, dmg, comportamento, idbullet){
            Qt.createQmlObject(`
               import QtQuick 2.0

                Rectangle {
                    id: id${bulletId}
                   property int posX: jogador.x + jogador.width
                    property int posY: jogador.y
                   color: "white"
                   width: 20
                   height: 20
                   x: posX
                   y: posY

                   Component.onCompleted: {
                               gamecontrol.appendBullet(parent, ${bulletId}, "")
                               bullet${bulletId}.setWidth(width);
                               bullet${bulletId}.setHeight(height);

                   }
                   Timer {

                           interval: 5; running: true; repeat: true
                           onTriggered: {
                                comportamentoMovimentoBullet( "${comportamento}"+"ITop", parent, bullet${bulletId}, ${velo})
                                comportamentoBulletColision(parent, gamecontrol, scoreControl, screenGame)
                           }
                       }

                Connections{

                            target: bullet${bulletId}

                               }

               }
               `,
               screenGame);

            Qt.createQmlObject(`
               import QtQuick 2.0

                Rectangle {
                    id: id${idbullet}secondbullet
                   property int posX: jogador.x + jogador.width
                  property int posY: jogador.y + jogador.height
                   color: "white"
                   width: 20
                   height: 20
                   x: posX
                   y: posY

                   Component.onCompleted: {
                               gamecontrol.appendBullet(parent, ${bulletId}, "Second")
                               bulletSecond${bulletId}.setWidth(width);
                               bulletSecond${bulletId}.setHeight(height);

                   }
                   Timer {
                           interval: 5; running: true; repeat: true
                           onTriggered: {
                                comportamentoMovimentoBullet( "${comportamento}"+"IBot", parent, bulletSecond${bulletId}, ${velo})
                                comportamentoBulletColision(parent, gamecontrol, scoreControl, screenGame)
                           }
                       }

                Connections{

                            target: bulletSecond${bulletId}

                               }

               }
               `,
               screenGame);



        }

        function onFlameShooting(velo, dmg, comportamento, idbullet){
            Qt.createQmlObject(`
               import QtQuick 2.0

                Rectangle {
                    id: id${bulletId}
                   property int posX: jogador.x + jogador.width
                    property int posY: jogador.y  + jogador.height
                   color: "white"
                   width: 200
                   height: 20
                   x: posX
                   y: posY

                   Component.onCompleted: {
                               gamecontrol.appendBullet(parent, ${bulletId}, "")
                               bullet${bulletId}.setWidth(width);
                               bullet${bulletId}.setHeight(height);

                   }
                   Timer {

                           interval: 5; running: true; repeat: true
                           onTriggered: {
                                comportamentoMovimentoBullet( "${comportamento}", parent, bullet${bulletId}, ${velo})
                                comportamentoBulletColision(parent, gamecontrol, scoreControl, screenGame)
                           }
                       }

                Connections{

                            target: bullet${bulletId}

                               }

               }
               `,
               screenGame);
        }

        function onPlayerDead(){
             jogador.destroy();
        }

    }
    Connections{
        target: playerControl

        function onMaxHealtChanged(h){
            console.log("entrou em maxHEaltChanged", h)
           displayMaxHealt.text = h;
        }

        function onHealtChanged(h){
           displayHealt.text = h
            healtPlayerUi.value = h/100
            //console.log("entrou em HEaltChanged", h)

        }

        function onAmmoQtdChanged(a){
            displayAmmo.text = a

        }

        function onAmmoMaxChanged(a){
            displayMaxAmmo.text = a
        }

        function onDead(){
                //screenGame.destroy()
                //jogador.destroy();
        }
    }
    Connections{
        target: scoreControl

        function onValueChanged(s){
            //score.text = s;
            //scoreAnimation.start();
        }

    }
    Keys.onPressed: (event) => {
        if(event.key == Qt.Key_D){
                moveToRigth()
        }
        if(event.key == Qt.Key_A){
            moveToLeft()
        }
         if(event.key == Qt.Key_Space){
             //gamecontrol.shoot(jogador.x + jogador.width, ((jogador.y + jogador.height/4)), bulletId)
            gamecontrol.shoot(bulletId)
                            bulletId++;
         }
         if(event.key == Qt.Key_W){
             moveToUp()
         }
         if(event.key == Qt.Key_S){
             moveToDown()
         }
         if(event.key == Qt.Key_R){
                            console.log("R PRESSINONADO: ")
                playerControl.reloadWeapon();
             }
        //forcaGravitacional()
    }

    function moveToRigth(){
        if(jogador.x + jogador.width < screenGame.width){
            jogador.x+= velocidade;
            playerControl.setPositionX(jogador.x);
            if(velocidade < 10){
                velocidade+= 1
            }
        }

    }

    function moveToLeft(){
        if(jogador.x > 0){
            jogador.x-= velocidade;
            playerControl.setPositionX(jogador.x);
            if(velocidade < 10){
                velocidade+= 1
            }
             //velocidade+= aceleracao
        }

    }

    function moveToDown(){
        if(jogador.y + jogador.height < screenGame.height){
            jogador.y+= velocidade;
            playerControl.setPositionY(jogador.y);
            if(velocidade < 10){
                velocidade+= 1
            }
            // velocidade+= aceleracao
        }
    }


    function moveToUp(){
        if(jogador.y > 0){
            jogador.y-= velocidade;
            playerControl.setPositionY(jogador.y);
            if(velocidade < 10){
                velocidade+= 1
            }
        }
    }
    function createEnemyObject(){
        //console.log("inimigo: ", enemy_count)
        var alturaInimigo = 50;
        Qt.createQmlObject(` import QtQuick 2.0

                           Rectangle {
                               property double life: enemy${enemy_count}.getLife();
                               property double damage: enemy${enemy_count}.getDmg();
                                property double velocity: enemy${enemy_count}.getVelocity();
                               id: enemigo${enemy_count}
                               color: "BLUE"
                               width: 50
                               height: ${alturaInimigo}
                               x: parent.width
                               y: ${randomPositionEnemyGenerator(alturaInimigo)}
                               border.color: "black"
                           Component.onCompleted: {
                                       gamecontrol.appendEnemy(enemigo${enemy_count}, ${enemy_count})
                                       enemy${enemy_count}.setWidth(width);
                                       enemy${enemy_count}.setHeight(height);
                           }
                           Timer {
                                    id: timerEnemy${enemy_count}
                                   interval: 1; running: true; repeat: true
                                   onTriggered: {
                                        x -= velocity;
                                        var xis= x;
                                        var ypsilon = y;
                                        enemy${enemy_count}.setPositionX(xis);
                                        enemy${enemy_count}.setPositionY(ypsilon);
                                        if(x + width <= 0 || life <= 0){
                                            gamecontrol.removeEnemy(enemigo${enemy_count});
                                            enemigo${enemy_count}.destroy()
                                        }

                                        if((jogador.x + jogador.width >= enemigo${enemy_count}.x) && (jogador.x + jogador.width) <=  (enemigo${enemy_count}.x + enemigo${enemy_count}.width) && (jogador.y >= enemigo${enemy_count}.y) && (jogador.y <= enemigo${enemy_count}.y + enemigo${enemy_count}.height)){
                                          // console.log("colidiu com o player")
                                           var dmg_toPlayer  = enemy${enemy_count}.getDmg();
                                           var enemy_life = enemy${enemy_count}.getLife();
                                           playerControl.receiveDmg(dmg_toPlayer);

                                            gamecontrol.removeEnemy(enemigo${enemy_count});
                                            enemigo${enemy_count}.destroy()
                                        }
                                        else if((jogador.x + jogador.width >= enemigo${enemy_count}.x) && (jogador.x + jogador.width) <=  (enemigo${enemy_count}.x + enemigo${enemy_count}.width) && (jogador.y + jogador.height >= enemigo${enemy_count}.y) && (jogador.y <= enemigo${enemy_count}.y + enemigo${enemy_count}.height)){
                                            //console.log("colidiu com o player")
                                           var dmg_toPlayer  = enemy${enemy_count}.getDmg();
                                            playerControl.receiveDmg(dmg_toPlayer);
                                            gamecontrol.removeEnemy(enemigo${enemy_count});
                                            enemigo${enemy_count}.destroy()
                                        }
                                       else if((jogador.x >= enemigo${enemy_count}.x) && (jogador.x ) <=  (enemigo${enemy_count}.x + enemigo${enemy_count}.width) && (jogador.y + jogador.height >= enemigo${enemy_count}.y) && (jogador.y <= enemigo${enemy_count}.y + enemigo${enemy_count}.height)){
                                           //console.log("colidiu com o player")
                                            var dmg_toPlayer  = enemy${enemy_count}.getDmg();
                                            playerControl.receiveDmg(dmg_toPlayer);
                                            gamecontrol.removeEnemy(enemigo${enemy_count});
                                           enemigo${enemy_count}.destroy()

                                       }

                                   }
                               }
                           Connections{
                                target: enemy${enemy_count}
                            }
                           Connections{
                                target: playerControl
                           }
                           }
                           `,
                           screenGame)
        enemy_count++;
    }

    function randomPositionEnemyGenerator(alturaInimigo){
        var result = Math.floor(Math.random() * (screenGame.height - alturaInimigo));
        return result;

    }

    function atualizarPosition(){

       var result =  1
        return result;
    }

    function destruirSeTocar(x_){
       var _result = false;
        if(x_ <= 0){
          _result = true;
       }
        return _result;
    }

    function comportamentoMovimentoBullet(comportamento, id_object, controler, velo){
        console.log("entrou em comportamento bullet: ", comportamento)


        switch (comportamento) {
          case "doubleVTop":
              id_object.x += velo
              id_object.y -= velo
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
            break;
          case "doubleVBot":
              id_object.x += velo
              id_object.y += velo
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
             break;
          case "doubleITop":
              id_object.x += velo
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
            break;
          case "doubleIBot":
              id_object.x += velo
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
              break;
          case "defaultFi":
              console.log("case: defaultFi")
              id_object.x += velo
              id_object.y -= getSen(id_object.x, 25)
              //aux_fi++;
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
              break;
          case "flame":
              console.log("vase: defaultFlame")
              id_object.x = jogador.x+jogador.width
              id_object.y = jogador.y+jogador.height/4
              //aux_fi++;
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
              break;
          default:
              id_object.x += velo
              controler.setPositionX(id_object.x);
              controler.setPositionY(id_object.y);
            break;
        }



    }

    function comportamentoBulletColision(bullet, gamecontrol, scoreControl, screen){
        if((bullet.y <= 0) || (bullet.x + bullet.width >= screenGame.width) || (bullet.y+bullet.height >= screenGame.height)){
            //console.log("VALOR BULLET.Y: ", bullet.x, " VALOR SCREENY: ", screenGame.y)
           gamecontrol.removeBullet(bullet);
            bullet.destroy();

        }

        var obj_enemies =  gamecontrol.bulletEnemyColision();
        for(var li = 0; li< obj_enemies.length ; li++)
        {
             var ini_x = obj_enemies[li].x;
             var ini_y = obj_enemies[li].y;
             var largura = obj_enemies[li].width;
             var altura = obj_enemies[li].height;

            var dmg_toPlayer  = obj_enemies[li].damage;
            var enemy_life = obj_enemies[li].life;
            var result = scoreControl.addScore(dmg_toPlayer, enemy_life);

            if((bullet.x + bullet.width >= ini_x && (bullet.x + bullet.width) <= (ini_x + largura)) && (bullet.y >= ini_y  && bullet.y <= ini_y + altura))
             {
                confirmColision(gamecontrol, bullet, obj_enemies[li],result);

             }
             else if((bullet.x + bullet.width >= ini_x && (bullet.x + bullet.width) <= (ini_x + largura)) && (bullet.y + bullet.height >= ini_y && (bullet.y + bullet.height) <= (ini_y + altura))){

                confirmColision(gamecontrol, bullet, obj_enemies[li], result);
             }
            else if(bullet.y <= ini_y  && bullet.y >= ini_y + altura){
                confirmColision(gamecontrol, bullet, obj_enemies[li], result);
            }
        }
    }

    function confirmColision(gamecontrol, bullet, obj_enemy, result){
        score.text =result;
        gamecontrol.removeEnemy(obj_enemy);
        bullet.destroy()
        obj_enemy.destroy()
    }

    function getFibonnaci(n){
        let a = 0, b = 1, c = n;

          for(let i = 0; i <= n; i++) {
            c = a + b;
            a = b;
            b = c;
          }
          return c;
    }

    function getSen(x, raio){
         return Math.sin(x) * raio;
    }

    function getCircunference(radius){
        return 2 * Math.PI * radius;
    }

    function getCircle(x, raio){
        var result =(Math.pow(raio, 2)) - (Math.pow(x, 2))
        return result;

    }

}
