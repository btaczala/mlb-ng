import QtQuick 2.0
import ".."

PageWithMenu {
    id: root
    width: 100
    height: 62

    function start() {
        dataManager.refreshPlayersList();
    }

    Connections {
        target: dataManager
        onPlayersListRefreshed: {
            busy = false;
        }
    }

    component: ListView {
        id: playersListItem
        anchors.fill: parent
        clip: true
        model: playersModel
        delegate: ListDelegate {
            itemText: playerName
            width: playersListItem.width
            haveHighlight: false
            onItemClicked: {
                var string = Qt.resolvedUrl("Player.qml");
                var props = {playerID: playerID,   title: playerName}
                pushNext(string, props)
            }
        }

        Component.onCompleted: {
            root.rootItem = playersListItem
            root.busy = true;
        }
    }
}
