import QtQuick 2.0

ListModel {
    id: applicationsList
    ListElement {
        appName: "Articles"
        appTitle: "Articles"
    }
    ListElement {
        appName: "Players"
        appTitle: "Players"
    }

    ListElement {
        appName: "Schedule"
        appTitle: "Schedule"
    }

    ListElement {
        appName: "Teams"
        appTitle: "Teams"
    }

//    ListElement {
//        appName: "Scores"
//    }

    ListElement {
        appName: "Standings"
        appTitle: "Standings"
    }

    ListElement {
        appName: "Settings"
        appTitle: "Settings"
    }
}
