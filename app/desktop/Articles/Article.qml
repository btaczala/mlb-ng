import QtQuick 2.0
import QtQuick.Controls 1.0
import ".."

PageWithMenu {
    id: rootItem
    width: 400
    height: 600

    function start() {
    }

    component: Item {
        id: item
        anchors.fill: parent
        Component.onCompleted: {
            rootItem.rootItem = item;
        }

        Flickable {
            id: textItemArea
            width: parent.width
            height: parent.height*0.8
            contentWidth: textItem.width
            contentHeight: textItem.height
            flickableDirection: Flickable.VerticalFlick
            clip: true

            Text {
                id: textItem
                text: params? params["articleText"] : ""
                wrapMode: Text.WordWrap
                color: "white"
                font.pixelSize: 24
                width: rootItem.width
            }
        }

        ScrollBar {
            flickable: textItemArea
        }

        Item {
            width: parent.width
            height: parent.height*0.2
            anchors.top: textItemArea.bottom

            ListView {
                anchors.fill: parent
                orientation: ListView.Horizontal
                model: params ? params["articleImages"] : null
                delegate: Image {
                    width: height
                    height: parent.height
                    source: articleImage
                    smooth: true

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var url = Qt.resolvedUrl("ArticleImages.qml");
                            var props = { images: params["articleImages"], title: "Article Images" }
                            pushNextPage(url,props)
                        }
                    }
                }
            }
        }
    }
}
