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

            Item {
                Column {
                    anchors.centerIn: parent
                    spacing: 12

                    Text {
                        font.family: "Avenir"
                        font.pointSize: 24
                        text: helper.天氣概況
                    }

                    Text {
                      font.family: "Avenir"
                      font.pointSize: 72
                      text: helper.溫度 + "°"
                    }

                    Text {
                        font.family: "Avenir"
                        font.pointSize: 36
                        color: "#555"
                        text: helper.最低溫 + " ~ " + helper.最高溫 + "°"
                    }
                }
            }

        } // secondTab

        Tab {
            id: thirdTab
            title: "Playground"

            // 在這裡寫第三個 tab 的內容
        } // thirdTab
    }

    // 這是範例程式裏面幫助大家連網路的小工具
    HttpRequestHelper {
        id: helper
        property string 溫度: "??"
        property string 天氣概況: ""
        property int 最低溫: 0
        property int 最高溫: 100

        onDone: {
            var 氣象資料 = JSON.parse(data)
            helper.溫度 = Math.round(氣象資料.main.temp - 273.15)
            helper.最低溫 = Math.round(氣象資料.main.temp_min - 273.15)
            helper.最高溫 = Math.round(氣象資料.main.temp_max - 273.15)
            helper.天氣概況 = 氣象資料.weather[0].main

        }
    }

    Component.onCompleted: {
        // 在這裡寫啟動程式時要做的事情
        helper.send("http://api.openweathermap.org/data/2.5/weather?q=Taipei")

    }
}
