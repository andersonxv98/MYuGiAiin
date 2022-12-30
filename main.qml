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
       source: "qrc:/menudragndrop.qml"
    }
    Loader{
         anchors.fill: parent
       source: "qrc:/exercicioslistamateria.qml"
    }
    Loader{
      anchors.fill: parent
      source: "qrc:/dragNDop.qml"
     }
}
