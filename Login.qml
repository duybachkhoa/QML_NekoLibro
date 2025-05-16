import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts
Rectangle {
    color: "lightblue"
    visible: true
    Timer{
        id: loginTimer
        interval: 2000
        repeat: false
        onTriggered: {
            busyLogin.running = false
            replaceS("NekoLibro.qml", StackView.Immediate);
        }
    }

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 10
        width: parent.width * 0.5
        Label{
            text: "Đăng nhập"
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            color: "#333"
        }
        TextField{
            id: usernameField
            color: "black" //Màu chữ nhập vào
            placeholderText: "Tài khoản"
            placeholderTextColor: "#666"
            Layout.fillWidth: true
            Layout.preferredHeight: 50 //Đặt độ cao nhưng ko phá vỡ spacing
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: usernameField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }

        TextField{
            id: passwordField
            color: "black"
            placeholderText: "Mật khẩu"
            placeholderTextColor: "#666"
            echoMode: TextInput.Password
            Layout.fillWidth: true
            Layout.preferredHeight: 50
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: passwordField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }

        Button{
            id: loginButton
            text: "Đăng nhập"
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            font.pixelSize: 20
            highlighted: true
            background: Rectangle{
                radius: 20
                color:  loginButton.pressed ? "#005ea2" : "#0078d4"
            }
            contentItem: Text{
                text: parent.text
                color: "white"
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                busyLogin.running = true
                loginTimer.start()
                messageLabel.text = "Đăng nhập thành công."
                messageLabel.color = "green"
            }
        }
        Button{
            text: "Quên mật khẩu?"
            flat: true
            font.pixelSize: 20
            Layout.alignment: Qt.AlignCenter
            background: Rectangle {
                color: "transparent"  // Không có màu nền
            }
            contentItem: Text{
                text: parent.text
                color: "black"
                font: parent.font
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
        RowLayout{
            Label{
                text: "Chưa có tài khoản?"
                color: "black"
            }
            Button{
                id: newAccButton
                text: "Tạo tài khoản mới"
                Layout.fillWidth: true
                font.pixelSize: 20
                background: Rectangle{
                    radius: 20
                    color: newAccButton.pressed ? "#C1E1FA" : "white"
                    border.color: "#0078d4"
                    border.width: 2
                }
                contentItem: Text{
                    text: parent.text
                    font: parent.font
                    color: "#0078d4"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: pushS("Register.qml")
            }
        }
        Label{
            id: messageLabel
            font.pixelSize: 20
        }
    }//ColumnLayout
    BusyIndicator{
        id: busyLogin
        running: false
        visible: running
        anchors.centerIn: parent
        scale: 1.3
    }
}
