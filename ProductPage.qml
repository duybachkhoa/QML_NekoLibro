import QtQuick 2.15
import QtQuick.Controls
import Qt.labs.qmlmodels
import QtQuick.Layouts

Rectangle {
    id: productWindow
    visible: true
    RowLayout{
        id: rowLayout
        width: parent.width * 0.8
        spacing: 0
        Button{
            id: searchButton
            text: "Tìm kiếm"
            font.bold: true
            Layout.fillHeight: true
            background: Rectangle{
                color: searchButton.pressed ? "#0078d4" : "#0078d4"
            }
        }

        TextField{
            id: searchField
            Layout.fillWidth: true
            color: "black"
            font.pixelSize: 20
            placeholderText: "Nhập tên sản phẩm hoặc tác giả"
            placeholderTextColor: "#666"
            background: Rectangle{
                border.color: searchField.activeFocus ? "#0078d4" : "#666"
                border.width: 2
            }
        }

    }
    Button{
        anchors.bottom: parent.bottom
        text: "Thêm sản phẩm"
        background: Rectangle{
            color: searchButton.pressed ? "#0078d4" : "#0078d4"
        }
        onClicked:{
            var window = pushProductWindow.createObject(productWindow, {
                  // căn giữa parent
                  x: productWindow.x + (productWindow.width - pushProductWindow.width),
                  y: productWindow.y + (productWindow.height - pushProductWindow.height),
            })
            window ? window.show() : console.log("Mở thất bại cửa sổ .Thêm sản phẩm.")
        }
    }
    Rectangle{
        anchors.left: parent.left
        anchors.top: rowLayout.bottom
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "white"
        border.width: 1
        border.color: "black"
        HorizontalHeaderView{
            id: horHeader
            anchors.left: table.left
            anchors.top: parent.top
            syncView: table
            clip: true
            movableColumns: true //cho phép di chuyển giữa các cột
            delegate: Rectangle {
                implicitHeight: 30
                color: "#f0f0f0"
                border.color: "#ccc"

                Text {
                    text: column + 1
                    anchors.centerIn: parent
                    font.bold: true
                }
            }
        }
        VerticalHeaderView{
            id: verHeader
            anchors.top: table.top
            anchors.left: parent.left
            syncView: table
            clip: true
            delegate: Rectangle {
                implicitWidth: 30
                color: "#f0f0f0"
                border.color: "#ccc"
                Text {
                     text: row + 1 // Số thứ tự bắt đầu từ 1
                     anchors.centerIn: parent
                     font.bold: true
                 }
            }
        }

        TableView{
            id: table
            anchors.left: verHeader.right
            anchors.top: horHeader.bottom
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            clip: true
            columnSpacing: 1
            rowSpacing: 1

            model: TableModel{
                TableModelColumn { display: "name" }
                TableModelColumn { display: "color" }
                TableModelColumn { display: "colors" }

                rows: [
                    {
                        "name": "",
                        "color": "",
                        "colors": ""
                    },
                    {
                        "name": "",
                        "color": "",
                        "colors": ""
                    },
                    {
                        "name": "",
                        "color": "",
                        "colors": ""
                    }
                ]
            }
            delegate: Rectangle {
                implicitWidth: 100
                implicitHeight: 20
                color: "white"
                border.width: 1
                border.color: "black"
                Label {
                    text: display
                    color: "black"
                }
            }
        }
    }

    Component{   
        id: pushProductWindow
        Window{
            width: 500
            height: 500
            visible: true
            modality: Qt.ApplicationModal // chặn tương tác các cửa sổ phía sau
            ColumnLayout{
                width: parent.width * 0.8
                anchors.centerIn: parent
                spacing: 30
                Label{
                    text: "Thông tin sản phẩm"
                    color: "black"
                    font.pixelSize: 20
                    font.bold: true
                    Layout.alignment: Qt.AlignHCenter

                }
                GridLayout{

                    rowSpacing: 20
                    columns: 2

                    Label{
                        text: "Tên sản phẩm"
                        color: "black"

                    }
                    TextField {
                        id: nameField
                        Layout.fillWidth: true
                        color: "black"
                        background: Rectangle{
                            border.color: nameField.activeFocus ? "#0078d4" : "#666"
                        }
                    }

                    Label{
                        text: "Tên tác giả"
                        color: "black"
                    }
                    TextField {
                        id: authorField
                        Layout.fillWidth: true
                        color: "black"
                        background: Rectangle{
                            border.color: authorField.activeFocus ? "#0078d4" : "#666"
                        }
                    }
                    Label{
                        text: "Giá bán"
                        color: "black"
                    }
                    TextField {
                        id: sellField
                        Layout.fillWidth: true
                        color: "black"
                        background: Rectangle{
                            border.color: sellField.activeFocus ? "#0078d4" : "#666"
                        }
                    }
                    Label{
                        text: "Giá nhập"
                        color: "black"

                    }

                    TextField {
                        id: reSellField
                        Layout.fillWidth: true
                        color: "black"
                        background: Rectangle{
                            border.color: reSellField.activeFocus ? "#0078d4" : "#666"
                        }
                    }
                    Label{
                        text: "Loại"
                        color: "black"
                    }
                    TextField {
                        id: categoryField
                        Layout.fillWidth: true
                        color: "black"
                        background: Rectangle{
                            border.color: categoryField.activeFocus ? "#0078d4" : "#666"
                        }
                    }
                } // GridLaout
                RowLayout{
                    width: parent.width
                    spacing: 20
                    Button{
                        id: backButton
                        text: "Quay lại"
                        font.pixelSize: 20
                        Layout.fillWidth: true
                        background: Rectangle{
                            radius: 20
                            color: backButton.pressed ?  "#666" : "white"
                            border.width: 1
                        }
                        contentItem: Text{
                            text: parent.text
                            font: parent.font
                            color: "black"
                            horizontalAlignment: Qt.AlignHCenter
                            verticalAlignment: Qt.AlignVCenter
                        }
                    }
                    Button{
                        id: pushButton
                        text: "Thêm sản phẩm"
                        font.pixelSize: 20
                        Layout.fillWidth: true
                        background: Rectangle{
                            radius: 20
                            color: pushButton.pressed ?  "#005ea2" : "#0078d4"
                        }
                    }
                }
            } // ColumnLayout
        } // Window
    }

}
