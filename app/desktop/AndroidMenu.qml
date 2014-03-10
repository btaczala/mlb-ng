import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.1

Item {
    id: root
    property int menuBarHeight
    property int menuWidth
    property alias menuHeaderText: headerText.text

    property Component list
    property Component mainComponent
    property Component button

    signal menuVisibilityChanged(bool visible)

    function show() {
        root.state = "menu"
    }

    function hide() {
        root.state = "menuBar"
    }

    function flip() {
        if (root.state === "menu") {
            root.state = "menuBar"
        }
        else
            root.state = "menu"
    }

    function menuVisible() {
        return state === "menu"
    }

    state: "menuBar"

    onStateChanged: {
        menuVisibilityChanged(menuVisible());
    }

    Item {
        id: menuBar
        height: menuBarHeight
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }

        RowLayout {
            anchors.fill: parent

            Item {
                height: parent.height
                width: 60

                Loader {
                    sourceComponent: button
                    anchors.centerIn: parent
                }
            }

            Item {
                Text {
                    id: headerText
                }
            }
        }
    }

    Item {
        anchors {
            top: menuBar.bottom
            left: menu.right
            right: parent.right
            bottom: parent.bottom
        }

        Loader {
            sourceComponent: mainComponent
            anchors.fill: parent
        }

        MouseArea {
            anchors.fill: parent
            enabled: root.state === "menu"
            onClicked: {
                root.state = "menuBar"
            }
        }

        Rectangle {
            id: blackOut
            color: "black"
            anchors.fill: parent

            Behavior on opacity {
                NumberAnimation {}
            }
        }

        Behavior on opacity {
            NumberAnimation {}
        }
    }

    Item {
        id: menu
        anchors {
            left: parent.left
            top: menuBar.bottom
            bottom: parent.bottom
        }

        Loader {
            sourceComponent: list
            anchors.fill: parent
        }

        Behavior on width {
            NumberAnimation {}
        }
    }


    states: [
        State {
            name: "menuBar"
            PropertyChanges {
                target: blackOut
                opacity: 0
            }
            PropertyChanges {
                target: menu
                width: 0
            }
        },
        State {
            name: "menu"
            PropertyChanges {
                target: blackOut
                opacity: 0.7
            }
            PropertyChanges {
                target: menu
                width: menuWidth
            }
        }
    ]
}
