import QtQuick
import QtQuick.Controls

Window {
    width: 800
    height: 640
    visible: true
    visibility: "FullScreen"
    title: qsTr("Hello World")

   Loader{
    anchors.fill: parent
    source: "qrc:/resolucao.qml"
   }
   Loader{
    anchors.fill: parent
    source: "qrc:/btnOperadores.qml"
   }
   Loader{
       anchors.fill: parent
       source: "qrc:/enunciado.qml"
   }
}
