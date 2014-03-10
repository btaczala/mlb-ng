import QtQuick 2.0
import QtQuick.Controls 1.0
import ".."

PageWithMenu {
    id: root
    width: 100
    height: 62

    menuWidth: 300

    property string __currentLeague: ""

    function start() {
        __currentLeague = "Major"
        console.debug("Staring Schedule")
        dataManager.refreshSchedule(__currentLeague);
    }

    component: ListView {
        id: list
        Component.onCompleted: {
            rootItem = this
        }

        ScrollBar {
            flickable: list
            orienatation: ListView.Horizontal
        }

        currentIndex: 0
        snapMode: ListView.SnapOneItem
        orientation: ListView.Horizontal
        highlightFollowsCurrentItem: true
        spacing: 10
        model: ListModel {
            ListElement {
                league: "Major"
            }
            ListElement {
                league: "Pretendent"
            }
            ListElement {
                league: "Basic"
            }
        }

        delegate: LeagueSchedule {
            width: root.width
            height: root.height
            league: league
        }

        onCurrentIndexChanged: {
            busy();
            dataManager.refreshSchedule(league);
        }
    }
}
