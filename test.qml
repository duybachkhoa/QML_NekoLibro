import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 300
    title: qsTr("Test")

    Button {
        text: "Gọi hàm C++"
        onClicked: {
            testObj.sayHello(); // Gọi hàm từ C++
        }
    }
}
