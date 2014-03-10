import QtQuick 2.1
import QtQuick.Layouts 1.0
import ".."

PageWithMenu {
    id: rootItem

    property var __player: null

    function start() {
        dataManager.playerInfo(params["playerID"]);
    }

    Connections {
        target: dataManager
        onPlayerInfoReady: {
            busy = false;
            __player = player;
        }
    }

    component: Item {
        Component.onCompleted: {
            rootItem.rootItem = gridItem;
            rootItem.busy = true;
        }

        id: gridItem
        width: parent.width
        height: 120
        Rectangle {
            id: thumbImage
            color: "green"
            width: 64
            height: 64
        }
        Item {
            id: description
            anchors.left: thumbImage.right
            anchors.leftMargin: 5
            ColumnLayout {
                anchors.fill: parent
                RowLayout {
                    width: parent.width
                    Text {
                        text: "Name"
                    }
                    Text {
                        text: __player !== null ? __player.playerName : "";
                    }
                }
                Text {
                    text: "Nazwisko"
                }
            }
        }
    }
}
