//file quản lý các cửa sổ hiển thị chính: Login/Resister
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

ApplicationWindow {
    visible: true
    width: 1200
    height: 800
    header: ToolBar{
        height: 50
        background: Rectangle{
            color: "lightgreen"
            anchors.fill: parent
        }
        RowLayout{
            anchors.fill: parent
            Label {
                text: "NekoLibro"
                font.bold: true
                Layout.alignment: Qt.AlignVCenter
            }
            Item{
                Layout.fillWidth: true
            }

            Button {
                text: "Đăng xuất"
                onClicked:{
                    stackView.replace("Login.qml", StackView.Immediate)
                }
                Layout.alignment: Qt.AlignRight
            }
        }
    }
    footer: ToolBar{
        background: Rectangle{
            color: "lightblue"
            anchors.fill: parent
        }
        Text {
            text: stackView.depth
            color: "red"
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "NekoLibro.qml"
    }
    //hàm chuyển màn hình
    function pushS(screen){
        stackView.push(screen)
    }
    //hàm quay lại
    function popS(){
        if (stackView.depth > 1){
            stackView.pop();
        }
    }
    function replaceS(screen){
        stackView.replace(screen, StackView.Immediate)
    }
}
