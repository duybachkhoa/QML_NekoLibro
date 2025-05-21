import QtQuick 2.15
import QtQuick.Controls

Rectangle {
    visible: true
    color: "white"
    Column {
        anchors.centerIn: parent
        Text {
            width: 400
            height: 50
            text: qsTr("Settings")
            color: "#1C71D8"
            font.bold: true
            font.pixelSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        } // Text
        Text {
            text: "Interface"
            color: "#1C71D8"
            font.bold: true

        } // Text
        ComboBox {
            id: languageCB
            width: 400
            height: 50
            model: ["English", "Vietnamese"]
            contentItem: Text {
                text: languageCB.display
                color: "#1C71D8"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            } // Text
            background: Rectangle {
                color: "lightblue"
            } // Rectangle
            Text {
                text: qsTr("Language")
                color: "#1C71D8"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            } // Text
        } // ComboxBox
        ComboBox {
            id: themeCB
            width: 400
            height: 50
            model: ["Light", "Dark"]
            contentItem: Text {
                text: themeCB.display
                color: "#1C71D8"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
            } // Text
            background: Rectangle {
                color: "lightblue"
            } // Rectangle
            Text {
                text: qsTr("Theme")
                color: "#1C71D8"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
            } // Text
        } // ComboxBox
    } // Column
} // Rectangle
