import QtQuick 2.0
import QtQuick.Controls 1.0
import ".."

PageWithMenu {
    id: root
    width: 400
    height: 600
    busy: true

    property bool haveMenu: true

    function start() {
    }

    function aboutToShow() {
        console.debug("About to show ")
    }

    function aboutToHide() {
        console.debug("About to show ", params["menu"] )
    }

    component: ArticlesPage {
        id: artPage

        onArticleSelected: {
            var qmlString = Qt.resolvedUrl("Article.qml");
            pushNext(qmlString, params);
        }

        onArticlesReady: {
            busy = false;
        }

        Component.onCompleted: {
            root.rootItem = artPage;
        }
    }
}
