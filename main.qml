import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    visibility: Window.Maximized
    title: "開源資訊 App"

    Text {
        id: credit
        anchors {
            left: parent.left
            bottom: parent.bottom
            margins: 4
        }
        color: "#555"
        text: "Have fun with NTUOSC!"
    }

    TabView {
        id: tabs
        anchors.fill: parent
        anchors.margins: 24

        Tab {
            id: firstTab
            title: "新聞"

            // 在這裡寫第一個 tab 的內容

        } // firstTab

        Tab {
            id: secondTab
            title: "氣象"

            // 在這裡寫第二個 tab 的內容

        } // secondTab

        Tab {
            id: thirdTab
            title: "Playground"

            // 在這裡寫第三個 tab 的內容

            Text {
              id: ipText
              font.pointSize: 72
              text: helper.ip
            }

        } // thirdTab
    }

    // 這是範例程式裏面幫助大家連網路的小工具
    HttpRequestHelper {
        id: helper
        property string ip: "IP 掃描中 (=ﾟωﾟ)ﾉ"

        onDone: {
            helper.ip = data
        }
    }

    Component.onCompleted: {
        // 在這裡寫啟動程式時要做的事情
        helper.send("http://orange.tw")

    }
}
