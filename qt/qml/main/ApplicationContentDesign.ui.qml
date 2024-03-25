import QtQuick
import QtQuick.Layouts 2.15
import QtQuick.Controls
import Components

Item {
    id: root

    property alias cardListAllShows: cardListAllShows
    property alias cardListTrending: cardListTrending

    ColumnLayout {
        id: appContentColumn

        anchors.centerIn: root
        height: root.height
        width: root.width * _screenContentWidthRatio

        CardList {
            id: cardListTrending

            Layout.fillHeight: true
            Layout.fillWidth: true
            exTitleList: qsTr("Trending Now")
        }

        CardList {
            id: cardListAllShows

            Layout.fillHeight: true
            Layout.fillWidth: true
            exTitleList: qsTr("All Shows")
        }
    }
}
