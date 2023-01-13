import QtQuick
import QtQuick.Controls

Window {
    width: 800
    height: 640
    visible: true
    visibility: "FullScreen"
    title: qsTr("DropImDraggin")

    Rectangle{
        anchors.fill: parent
        gradient: Gradient{
            GradientStop { position: 0.0; color: "#5FF5B4" }
            GradientStop { position: 1.1; color: "#57FF6B"}
            orientation: Gradient.Horizontal
        }

    /*Loader{
        anchors.fill: parent
        source: "qrc:/login.qml"
    }
    Loader{
      anchors.fill: parent
      source: "qrc:/menudragndrop.qml"
     }*/

        /*Loader{
            anchors.fill: parent
            source: "qrc:/configmenu.qml"
        }*/

    Loader{
        anchors.fill: parent
        source: "qrc:/hidegame.qml"
    }



    Keys.onPressed: (event)=> {
        if(event.key == Qt.Key_Escape){
                            console.log("ESQ Q, vai quitar?")
                            Qt.quit();
                        }
    }
    }
}
