import QtQuick 2.0
import ".."

ListDelegate {
    id: root
    width: 100
    height: 300
    radius: 2
    haveHighlight: false

    property var images
    property alias text:textItem.text

    Item {
        id: imageItem
        anchors.top: parent.top
        anchors.topMargin: 10
        width: parent.width
        height: parent.height * 0.7

        Image {
            id: actualImageItem
            fillMode: Image.PreserveAspectFit
            source: images.get(0).articleImage
            anchors.fill: parent
        }
    }

    // image
    Item {
        width: parent.width
        height: parent.height * 0.3
        anchors.top: imageItem.bottom

        Text {
            anchors.fill: parent
            id: textItem
            text: articleText
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            font.family: appStyle.font
            font.pixelSize: appStyle.fontSizeSmall
            color: appStyle.fontColor
        }
    }
}
