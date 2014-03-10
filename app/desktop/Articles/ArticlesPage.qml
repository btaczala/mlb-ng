import QtQuick 2.0
import QtQuick.Controls 1.1
import ".."

Item {
    id: root

    property bool __articles:false

    signal articleSelected(var params)
    signal articlesReady()

    Component.onCompleted: {
        dataManager.refreshArticles();
    }

    ListView {
        id: listViewItem
        clip: true
        spacing: 5
        anchors.fill: parent
        model: articlesModel
        opacity: __articles ? 1:0
        Behavior on opacity { NumberAnimation {} }

        delegate: ArticleDelegate {
            width: listViewItem.width
            height: 300
            fontSize: 16
            images: articleImages
            text: articleTitle

            onItemClicked: {
                var params = {
                             articleID:articleID,
                             articleText: articleText,
                             articleImages: articleImages,
                             title: articleTitle};
                console.debug("art", params)
                articleSelected(params);
            }
        }

        ScrollBar {
            flickable: listViewItem
        }
    }

    Connections {
        target: dataManager
        onArticlesRefreshed: {
            __articles = true;
            articlesReady()
        }
    }
}
