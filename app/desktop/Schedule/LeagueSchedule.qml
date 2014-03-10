import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.1
import QtWebKit 3.0
import ".."

PPage {
    id: root
    width: 300
    height: 600

    property string league
    busy: false

    Column {
        anchors.fill: parent
        Item {
            id: text
            width: parent.width
            height: parent.height *0.1

            Rectangle {
                anchors.fill: parent
                color: "yellow"
            }

            Text {
                color: "blue"
                text: "asdasdasdassadasd"
                anchors.centerIn: parent
            }
        }

        Item {
            width: parent.width
            height: parent.height - text.height
            ListView {
                id: list
                anchors.fill: parent
                model: dataManager.scheduleFor(league)
                spacing: 5
                clip: true
                delegate: Item {
                    width: list.width
                    height: 50
                    Loader {
                        id: loader
                        anchors.fill: parent
                        source: {
                            if (type==="split") {
                                return "SplitDelegate.qml";
                            }
                            else if(type==="game") {
                                return "GameDelegate.qml";
                            }
                        }
                    }
                }
            }
        }
    }
}
