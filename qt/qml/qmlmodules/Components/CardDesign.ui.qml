import QtQuick 2.15
import QtQuick.Layouts 2.15
import Components

Item {
    id: root

    property alias background: background
    property alias tvShowImage: tvShowImage
    property alias tvShowName: tvShowName
    property alias tvShowRating: tvShowRating

    height: contentColumn.height

    Rectangle {
        id: background

        anchors.fill: contentColumn
        color: Colors.background200
    }

    ColumnLayout {
        id: contentColumn

        Layout.fillWidth: true
        width: root.width

        Image {
            id: tvShowImage

            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            sourceSize.height: 260
        }

        Text {
            id: tvShowName

            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            Layout.preferredWidth: root.width
            color: Colors.neutral100
            elide: Text.ElideRight
            font: Fonts.title300
            horizontalAlignment: Text.AlignHCenter
            maximumLineCount: 1
            text: qsTr("Tv Show Name Test")
        }

        Text {
            id: tvShowRating

            Layout.alignment: Qt.AlignCenter
            color: Colors.neutral100
            font: Fonts.body100
            text: qsTr("9.5")
        }
    }
}
