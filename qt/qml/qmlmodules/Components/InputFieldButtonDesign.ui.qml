import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    id: root

    property alias searchButton: searchButton
    property alias searchField: searchField

    height: 60
    width: searchField.width + searchButton.width

    RowLayout {
        id: rowContent

        anchors.fill: root

        TextField {
            id: searchField

            clip: true
            color: Colors.neutral100
            font: Fonts.body300
            implicitHeight: 60
            implicitWidth: 300
            placeholderText: qsTr("Type a show to search")
            placeholderTextColor: Colors.neutral100

            background: Rectangle {
                border.color: searchField.focus ? Colors.primaryColor : Colors.background500
                border.width: 3
                color: Colors.background200
                radius: 8
            }
        }

        Button {
            id: searchButton

            font: Fonts.title300
            text: qsTr("Search")

            background: Rectangle {
                border.color: Colors.background500
                border.width: 1
                color: searchButton.down ? Colors.background200 : Colors.primaryColor
                implicitHeight: 60
                implicitWidth: 100
                radius: 8
            }
        }
    }
}
