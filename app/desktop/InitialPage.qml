import QtQuick 2.0
import "Articles"

PPage {
    width: 400
    height: 500
    rootItem: articlesPage
    busy: true

    ArticlesPage {
        id: articlesPage
        anchors.fill: parent
        onArticleSelected: {
            var qmlString = Qt.resolvedUrl("Articles/Article.qml");
            pushNext(qmlString, params);
        }
        onArticlesReady: {
            busy = false;
        }
    }
}
