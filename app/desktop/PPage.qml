import QtQuick 2.0
import QtQuick.Controls 1.1

Item {
    width: 400
    height: 600
    property var rootItem: null
    property var params: null

    property var globalMenu: null
    property bool busy

    onBusyChanged: {
        if (busy) {
            if (rootItem) {
                rootItem.opacity = 0;
            }
            busyRectItem.opacity = 1;
        }
        else {
            if (rootItem) {
                rootItem.opacity = 1;
            }
            busyRectItem.opacity = 0;
        }
    }

    state: "loading"
    signal pushNext(string page, var index)
    signal pop()

    function start() {
        console.debug("Overwrite this for custom behaviour")
    }

    function aboutToShow() {
    }

    function aboutToHide() {
    }

    Rectangle {
        color: appStyle.background
        anchors.fill: parent
    }

    BusyIndicator {
        id: busyRectItem
        width: 100
        height: 100
        anchors.centerIn: parent
        visible: true
        opacity: 0

        Behavior on opacity { NumberAnimation {} }
    }
}
