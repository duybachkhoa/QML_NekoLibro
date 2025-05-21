//file quản lý các trang hiển thị: Home/Product/Sell/Staff/Account/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    id: window
    visible: true
    property string currentPage: "none" // biến lưu page hiện tại(home/product/sell/staff/account)
    RowLayout{
        anchors.fill: parent
        Rectangle{
            width: 150
            color: "lightblue"
            Layout.fillHeight: true
            Column{
                anchors.fill: parent
                topPadding: 100
                Button{
                    id: homeButton
                    width: parent.width
                    height: 50
                    text: "Tổng quan"
                    font.pixelSize: 20
                    background: Rectangle{
                        color:  currentPage == "home" ? "#005ea2" : "#0078d4"
                    }
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font: parent.font
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked:{
                        currentPage = "home"
                        contentLoader.source = "HomePage.qml"
                    }
                }
                Button{
                    id: productButton
                    width: parent.width
                    height: 50
                    text: "Sản phẩm"
                    font.pixelSize: 20
                    background: Rectangle{
                        color:   currentPage == "product" ? "#005ea2" : "#0078d4"
                    }
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font: parent.font
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked:{
                        currentPage = "product"
                        contentLoader.source = "ProductPage.qml"

                    }
                }
                Button{
                    id: sellButton
                    width: parent.width
                    height: 50
                    text: "Bán hàng"
                    font.pixelSize: 20
                    background: Rectangle{
                        color:  currentPage == "sell" ? "#005ea2" : "#0078d4"
                    }
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font: parent.font
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked:{
                        currentPage = "sell"
                        contentLoader.source = "SellPage.qml"
                    }
                }
                Button{
                    id: staffButton
                    width: parent.width
                    height: 50
                    text: "Nhân viên"
                    font.pixelSize: 20
                    background: Rectangle{
                        color:   currentPage == "staff" ? "#005ea2" : "#0078d4"
                    }
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font: parent.font
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked:{
                        currentPage = "staff"
                        contentLoader.source = "StaffPage.qml"
                    }
                }
                Button{
                    id: accountButton
                    width: parent.width
                    height: 50
                    text: "Tài khoản"
                    font.pixelSize: 20
                    background: Rectangle{
                        color:  currentPage == "account" ? "#005ea2" : "#0078d4"
                    }
                    contentItem: Text{
                        text: parent.text
                        color: "white"
                        font: parent.font
                        verticalAlignment: Text.AlignVCenter
                    }
                    onClicked:{
                        currentPage = "account"
                        contentLoader.source = "AccountPage.qml"
                    }
                }
            }
        }
        Rectangle{
            color: "white"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Loader{
                id: contentLoader
                anchors.fill: parent
            }
        }
    }
}
