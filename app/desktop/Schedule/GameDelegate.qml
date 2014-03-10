import QtQuick 2.0

Rectangle {
    id: root
    width: 400
    height: 50
    color: "white"

    Row {
        anchors.fill: parent

        Item {
            id: left
            height: parent.height
            width: (root.width - middle.width)/2
            Text {
                anchors.centerIn: parent
                text: teamA
            }
        }

        Item {
            id: middle
            width: 0.1*root.width
            height: parent.height
            Text {
                anchors.centerIn: parent
                text: result
            }
        }

        Item {
            id: right
            height: parent.height
            width: (root.width - middle.width)/2
            Text {
                anchors.centerIn: parent
                text: teamB
            }
        }
    }
}
