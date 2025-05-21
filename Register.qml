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
            id: nameField
            color: "black"
            placeholderText: "Họ và tên"
            placeholderTextColor: "#666"
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            font.pixelSize: 16
            background: Rectangle{
                radius: 12
                border.color: nameField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
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
            placeholderText: "Mật khẩu"
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
                id: rePasswordRect
                radius: 12
                border.color: rePasswordField.activeFocus ? "#0078d4" : "#ccc"
                border.width: 1
            }
        }
        RowLayout{
            Label{
                text: "Giới tính"
                color: "blue"
            }
            RadioButton{
                id: maleRadio
                text: "Nam"
                indicator: Rectangle {
                    id: maleRect
                    implicitHeight: 20
                    implicitWidth: 20
                    radius: 10
                    x: maleRadio.leftPadding
                    y: parent.height / 2 - height / 2
                    border.color: "blue"
                    border.width: 3
                }
                Rectangle {
                    width: 10
                    height: 10
                    radius: 5
                    color: "blue"
                    anchors.centerIn: maleRect
                    visible: maleRadio.checked
                } // Rectangle
            }
            RadioButton{
                id: femaleRadio
                text: "Nữ"
                indicator: Rectangle {
                    id: femaleRect
                    implicitHeight: 20
                    implicitWidth: 20
                    radius: 10
                    x: maleRadio.leftPadding
                    y: parent.height / 2 - height / 2
                    border.color: "blue"
                    border.width: 3
                    Rectangle {
                        width: 10
                        height: 10
                        radius: 5
                        color: "blue"
                        anchors.centerIn: femaleRect
                        visible: femaleRadio.checked
                    }
                }
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
        Row {
            Layout.fillWidth: true
            Button{
                id: backButton
                font.pixelSize: 20
                Layout.fillWidth: true
                background: Rectangle{
                    radius: 20
                    color: backButton.pressed ? "#ccc" : "white"
                    border.color: "black"
                    border.width: 2
                }
                contentItem: Text{
                    text: "Quay lại"
                    font: parent.font
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: popS();
            }
            Button{
                id: registerButton
                text: "Đăng ký"
                font.pixelSize: 20
                Layout.fillWidth: true
                background: Rectangle{
                    radius: 20
                    color: registerButton.pressed ? "#005ea2" : "#0078d4"
                }
                onClicked: {
                    if (passwordField.text != rePasswordField.text) {
                        rePasswordRect.border.color = "red"
                        messageLabel.text = "Mật khẩu không trùng khớp."
                        messageLabel.color = "red"
                        return
                    }
                    login.createAccount(emailField.text, usernameField.text, passwordField.text, nameField.text)
                }
                Connections {
                    target: login
                    function onShowMessage(page, message, color, success) {
                        if (page !== "Register") return
                        messageLabel.text = message
                        messageLabel.color = color
                        if (success) dialog.open()
                    }
                }
            }
        } // Row
        Dialog {
            id: dialog
            modal: true
            width: 400
            anchors.centerIn: parent
            closePolicy: Popup.NoAutoClose   // ko tự đóng khi click ra ngoài
            standardButtons: Dialog.NoButton
            contentItem: Column {
                spacing: 10
                padding: 10
                Text {
                    text: "Đăng ký thành công! Có quay lại trang đăng nhập?"
                    wrapMode: Text.WordWrap
                }
                Row {
                    spacing: 20
                    Button {
                        width: 170
                        background: Rectangle {
                            color: "white"
                            border.width: 2
                            border.color: "black"
                        } // Rectangle
                        contentItem: Text {
                            text: "Hủy"
                            color: "black"
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                        } // Text
                        function clearFields() {
                            nameField.text = ""
                            emailField.text = ""
                            usernameField.text = ""
                            passwordField.text = ""
                            rePasswordField.text = ""
                        }
                        onClicked:{
                            clearFields()
                            dialog.close()
                        }
                    }

                    Button {
                        text: "Đồng ý"
                        width: 170
                        background: Rectangle {
                            color: "blue"
                            radius: 4
                        }
                        onClicked: {
                            popS()
                            dialog.close()
                        }
                    }
                }
            }
            background: Rectangle {
                color: "white"
                radius: 10
            } // Rectangle
        }
        Label {
            id: messageLabel
            font.pixelSize: 20
        } // Label
    }
}

