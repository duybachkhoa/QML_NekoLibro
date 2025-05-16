import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts

Rectangle {
    color: "lightblue"
    visible: true
    ColumnLayout{
        anchors.centerIn: parent
        spacing: 10
        width: parent.width * 0.5
        Label{
            text: "Đăng ký"
            font.pixelSize: 24
            font.bold: true
            Layout.alignment: Qt.AlignHCenter
            color: "#333"
        }
        TextField{
            id: emailField
            color: "black"
            placeholderText: "email"
            placeholderTextColor: "#666"
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: emailField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }
        TextField{
            id: usernameField
            color: "black"
            placeholderText: "Tên tài khoản mới"
            placeholderTextColor: "#666"
            Layout.fillWidth: true
            Layout.preferredHeight: 40
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
            placeholderText: "Mật khẩu mới"
            placeholderTextColor: "#666"
            echoMode: TextInput.Password
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: passwordField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }
        TextField{
            id: rePasswordField
            color: "black"
            placeholderText: "Nhập lại mật khẩu"
            placeholderTextColor: "#666"
            echoMode: TextInput.Password
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: rePasswordField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }
        RowLayout{
            Label{
                text: "Giới tính"
                color: "black"             
            }
            RadioButton{
                text: "Nam"
            }
            RadioButton{
                text: "Nữ"             
            }
        }

        RowLayout{ //Dùng row sẽ ko dùng dc layout.fillWight
            spacing: 5
            Label{
                text: "Ngày sinh"
                color: "black"           
            }
            TextField{
                id: birthdayField
                color: "black"
                placeholderText: "11/01/2005"
                placeholderTextColor: "#666"
                Layout.preferredHeight: 30
                Layout.preferredWidth: 100
                font.pixelSize: 16
                background: Rectangle{
                    radius: 7
                    border.color: birthdayField.activeFocus ? "#0078d4" : "#ccc"
                    border.width: 1
                }
            }
        }
        Button{
            id: registerButton
            text: "Đăng ký"
            font.pixelSize: 20
            Layout.preferredHeight: 40
            Layout.fillWidth: true

            background: Rectangle{
                radius: 20
                color: registerButton.pressed ? "#005ea2" : "#0078d4"
            }
        }
        Button{
            id: backButton
            text: "Quay lại"
            font.pixelSize: 20
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            background: Rectangle{
                radius: 20
                color: backButton.pressed ? "#ccc" : "white"
                border.color: "black"
                border.width: 2
            }
            contentItem: Text{
                text: parent.text
                font: parent.font
                color: "black"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: popS();
        }
    }
}

