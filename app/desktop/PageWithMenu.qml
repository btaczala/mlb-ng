import QtQuick 2.0
import QtQuick.Controls 1.0

PPage {
    id:rootItem
    width: 100
    height: 62

    property Component component
    property alias menuWidth: menu.menuWidth
    property alias list: menu.list
    property Component customButton: null
    property alias menuItem: menu

    Component.onCompleted: {
        if (customButton) {
            menu.button = customButton;
        }
    }

    AndroidMenu {
        id: menu
        anchors.fill: parent
        menuBarHeight: 100
        menuWidth: 0
        button: Button {
            text: "back"
            onClicked: {
                rootItem.pop();
            }
        }
        mainComponent: component
    }
}
