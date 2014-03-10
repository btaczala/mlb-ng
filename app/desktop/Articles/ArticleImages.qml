import QtQuick 2.0
import QtQuick.Controls 1.0
import ".."

PageWithMenu {
    id:rootItem
    width: 100
    height: 62

    component: ListView {
        id: listOfImages
        anchors.fill: parent
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        model: params ? params["images"]:ListModel;

        delegate: Item {
            width: listOfImages.width
            height: listOfImages.height
            Image {
                source: articleImage
                anchors.centerIn: parent
            }
        }
        ScrollBar {
            flickable: listOfImages
        }
    }
}
