import QtQuick 2.0
import QtQuick.Controls 1.0

StackView {
    id: stackView

    function pushNextPage(nextPageUrl, props){
        console.debug('Pushed next' + nextPageUrl );
        for (var prop in props ) {
            console.debug(prop, "=", props[prop]);
        }

        var component = Qt.createComponent(nextPageUrl)
        console.debug(component.errorString())
        var object = component.createObject();
        object.onPushNext.connect(pushNextPage);
        object.onPop.connect(pop);
        var page = stackView.push({
                           item:object,
                           properties: { params: props }
                       })
        page.globalMenu = globalMenu;
        page.aboutToShow();
        page.start();
    }

    anchors.fill: parent
    initialItem: Item {
        AndroidMenu {
            id: appMenu
            menuWidth: 200
            menuBarHeight: 100
            anchors.fill: parent
            mainComponent: InitialPage {
                anchors.fill: parent
                onPushNext: {
                    pushNextPage(page,index)
                }
            }
            button: Button {
                width: 40
                height: 40
                iconSource: "resources/grid.png"
                onClicked: {
                    if (appMenu.menuVisible()) {
                        appMenu.hide();
                    }
                    else {
                        appMenu.show();
                    }
                }
            }
            list: ListView {
                model: ApplicationsList {}
                clip: true
                currentIndex: 0

                delegate: ListDelegate {
                    radius: 0
                    width: 200
                    height: 60
                    fontSize: 20
                    itemText: appTitle
                    onItemClicked: {
                        appMenu.hide();
                        var string = Qt.resolvedUrl(appName + "/"+appName+".qml");
                        var props = { title: appName }
                        pushNextPage(string, props)
                    }
                }
            }
        }
    }
}
