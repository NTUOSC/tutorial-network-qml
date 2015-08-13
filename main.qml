import QtQuick 2.3
import QtQuick.Window 2.2
import QtQuick.Controls 1.2

Window {
    visible: true
    visibility: Window.Maximized

    TabView {
        id: tabs
        anchors.fill: parent
        anchors.margins: 12

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

        } // thirdTab
    }
}
