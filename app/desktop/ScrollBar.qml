import QtQuick 2.0

Item {

    property int orienatation: ListView.Vertical

    id: scrollbar;
    width: (handleSize + 2 * (backScrollbar.border.width +1));
    visible: (flickable.visibleArea.heightRatio < 1.0);
    anchors {
        top: orienatation === ListView.Vertical? flickable.top: undefined;
        right: flickable.right;
        bottom: flickable.bottom;
        margins: 1;
    }

    property Flickable flickable               : null;
    property int       handleSize              : 10;

    function scrollDown () {
        flickable.contentY = Math.min (flickable.contentY + (flickable.height / 4), flickable.contentHeight - flickable.height);
    }
    function scrollUp () {
        flickable.contentY = Math.max (flickable.contentY - (flickable.height / 4), 0);
    }

   Binding {
        target: handle;
        property: "y";
        value: (flickable.contentY * clicker.drag.maximumY / (flickable.contentHeight - flickable.height));
        when: (!clicker.drag.active);
    }
    Binding {
        target: flickable;
        property: "contentY";
        value: (handle.y * (flickable.contentHeight - flickable.height) / clicker.drag.maximumY);
        when: (clicker.drag.active || clicker.pressed);
    }
    Rectangle {
        id: backScrollbar;
        radius: 0;
        antialiasing: true;
        color: Qt.rgba(0.5, 0.5, 0.5, 0.85);
        opacity: 0
        border {
            width: 1;
            color: "darkgray";
        }
        anchors { fill: parent; }

        MouseArea {
            anchors.fill: parent;
            onClicked: { }
        }
    }
    Item {
        id: groove;
        clip: true;
        anchors {
            fill: parent;
            topMargin: (backScrollbar.border.width +1);
            leftMargin: (backScrollbar.border.width +1);
            rightMargin: (backScrollbar.border.width +1);
            bottomMargin: (backScrollbar.border.width +1 );
        }

        MouseArea {
            id: clicker;
            drag {
                target: handle;
                minimumY: 0;
                maximumY: (groove.height - handle.height);
                axis: Drag.YAxis;
            }
            anchors { fill: parent; }
        }
        Item {
            id: handle;
            height: Math.max (20, (flickable.visibleArea.heightRatio * groove.height));
            anchors {
                left: parent.left;
                right: parent.right;
            }

            Rectangle {
                id: backHandle;
                color: appStyle.delegateBackgroundColor
                radius: 0
                anchors { fill: parent; }

                Behavior on opacity { NumberAnimation { duration: 150; } }
            }
        }
        Behavior on opacity { NumberAnimation { duration: 100; } }
    }

    Timer {
        id: fadeOutTimer
        interval: 200
        running: true
        onTriggered: {
            groove.opacity = 0;
        }
    }

    Connections {
        target: flickable
        onMovementStarted: {
            fadeOutTimer.stop();
            groove.opacity = 1;
        }

        onMovementEnded: {
            fadeOutTimer.start();
        }
    }
}
