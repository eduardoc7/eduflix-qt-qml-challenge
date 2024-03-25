import QtQuick
import QtQuick.Controls
import Components

ApplicationWindow {
    id: root

    readonly property double _screenContentWidthRatio: 0.97

    title: qsTr("Eduflix")
    visibility: "FullScreen"
    visible: true

    background: Rectangle {
        color: Colors.background500
    }
    menuBar: MenuBarCustom {
        id: menuBar

        height: root.height * 0.1
        width: root.width

        onSearchFieldHasCleaned: app.resetModelToInitialShows()
        onSearchPressed: searchText => app.searchShowsByInput(searchText)
    }

    Component.onCompleted: app.loadMainShows()

    ApplicationContent {
        id: app

        anchors.fill: parent
    }
}
