import QtQuick 2.0
import QtQuick.Controls 1.0
import ".."

ApplicationWindow {
    id: rootWindow
    width: 500
    height: 800

    // global Menu
    Menu {
        id: globalMenu
    }

    Rectangle {
        color: appStyle.background
        anchors.fill: parent
    }

    MainStackView {
        anchors.fill: parent
    }
}
