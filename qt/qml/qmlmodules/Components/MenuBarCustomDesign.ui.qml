import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts 2.15
import Components

Item {
    id: root

    property alias inputField: inputField

    Rectangle {
        id: background

        anchors.fill: root
        color: Colors.background500
    }

    RowLayout {
        id: rowContent

        anchors.fill: root

        Image {
            id: logoImage

            Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
            Layout.leftMargin: (root.width - (root.width * _screenContentWidthRatio)) / 2
            source: "https://fontmeme.com/permalink/240323/e5fc0089b07c12fb938a9c75cad50df2.png"
        }

        InputFieldButton {
            id: inputField

            Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
            Layout.rightMargin: (root.width - (root.width * _screenContentWidthRatio)) / 2
        }
    }
}
