import QtQuick 2.0

Item {

    signal articlesRefreshed();
    signal playersListRefreshed();

    signal playerInfoReady(var player)

    function refreshArticles() {
        articleRefreshTimer.start();
    }

    function refreshPlayersList() {
        playersListRefreshed();
    }

    function playerInfo(playerID) {
        var player = { playerName: "Bartosz", playerLastName: "Taczała"}
        playerInfoReady(player);
    }

    function refreshSchedule(name) {
        console.debug("Refresh Schedule "+name)
    }

    function scheduleFor(league) {
        return scheduleModel;
    }

    Timer {
        id: articleRefreshTimer
        interval: 500
        onTriggered: articlesRefreshed();
    }
}
