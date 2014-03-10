import QtQuick 2.0

Item {
    id: rootItem
    width: 200
    height: 50
    property alias itemText:title.text
    property string icon: ""
    property alias radius: bckItem.radius
    property alias fontSize: title.font.pixelSize
    property bool haveHighlight: true

    signal itemClicked(string itemName)

    Rectangle {
        id: bckItem
        anchors {
            fill: parent
            leftMargin: 5
            rightMargin: 5
            topMargin: 5
            bottomMargin: 5
        }
        color: appStyle.delegateBackgroundColor
        opacity: mouse.pressed ? 0.3: 0.4
        radius: 40
    }

    Text {
        id: title
        color: appStyle.fontColor
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: appStyle.fontSizeMedium
        font.family: appStyle.font
        font.bold: haveHighlight && currentIndex === index
        text: "wi19023safnaosdnggfp9hshO(DHJOASO)"
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 30
            right: parent.right
        }
    }

    MouseArea {
        id: mouse
        anchors.fill: parent
        onClicked: {
            rootItem.itemClicked(itemText)
        }
    }
}
