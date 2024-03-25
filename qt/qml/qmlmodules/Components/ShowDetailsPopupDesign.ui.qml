import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Popup {
    id: root

    property alias closeButton: closeButton
    property alias contentSummary: contentSummary
    property alias repeaterGenres: repeaterGenres
    property alias tvShowImage: tvShowImage
    property alias tvShowName: tvShowName
    property alias tvShowRating: tvShowRating
    property alias tvShowReleasedDate: tvShowReleasedDate

    closePolicy: Popup.NoAutoClose
    dim: false
    focus: true
    height: columnContent.height
    modal: true

    contentItem: Rectangle {
        id: background

        anchors.fill: parent
        color: Colors.background200
        focus: true
        radius: 8

        ColumnLayout {
            id: columnContent

            width: background.width

            Button {
                id: closeButton

                Layout.alignment: Qt.AlignTop | Qt.AlignRight
                Layout.rightMargin: 24
                Layout.topMargin: 8
                font: Fonts.title300
                text: qsTr("Fechar")

                background: Rectangle {
                    border.color: Colors.background200
                    color: closeButton.down ? Colors.background200 : Colors.primaryColor
                    radius: 8
                }
            }

            RowLayout {
                id: rowContent

                spacing: 24

                Image {
                    id: tvShowImage

                    Layout.leftMargin: 24
                    source: "https://static.tvmaze.com/uploads/images/medium_portrait/481/1204342.jpg"
                    sourceSize.height: 260
                }

                ColumnLayout {
                    id: columnContentDetails

                    Layout.alignment: Qt.AlignTop | Qt.AlignLeft
                    spacing: 12

                    Text {
                        id: tvShowName

                        Layout.fillWidth: true
                        color: Colors.neutral100
                        elide: Text.ElideRight
                        font: Fonts.heading300
                        maximumLineCount: 1
                        text: qsTr("The Office")
                        wrapMode: Text.WordWrap
                    }

                    Rectangle {
                        id: tvShowRatingContainer

                        color: Colors.background500
                        height: tvShowRating.height
                        radius: 8
                        width: tvShowRating.width

                        Text {
                            id: tvShowRating

                            color: Colors.neutral100
                            font: Fonts.body300
                            padding: 12
                            text: qsTr("6.7")
                        }
                    }

                    RowLayout {
                        id: rowGenres

                        Text {
                            id: titleGenres

                            color: Colors.neutral100
                            font: Fonts.title300
                            text: qsTr("GÊNEROS:")
                        }

                        Repeater {
                            id: repeaterGenres

                            model: ["test", "test", "test"]

                            delegate: Text {
                                color: Colors.neutral100
                                font: Fonts.body200
                                text: modelData
                            }
                        }
                    }

                    RowLayout {
                        id: rowReleasedDate

                        Text {
                            id: titleReleasedDate

                            color: Colors.neutral100
                            font: Fonts.title300
                            text: qsTr("DATA DE LANÇAMENTO:")
                        }

                        Text {
                            id: tvShowReleasedDate

                            color: Colors.neutral100
                            font: Fonts.body200
                            text: qsTr("Mar. 02, 2024")
                        }
                    }
                }
            }

            ColumnLayout {
                id: columnSummary

                Layout.topMargin: 8

                Text {
                    id: titleSummary

                    Layout.leftMargin: 24
                    color: Colors.neutral100
                    font: Fonts.title400
                    text: qsTr("Sinopse")
                }

                Text {
                    id: contentSummary

                    Layout.bottomMargin: 48
                    Layout.leftMargin: 24
                    Layout.preferredWidth: background.width - 48
                    Layout.rightMargin: 24
                    color: Colors.neutral100
                    font: Fonts.body300
                    horizontalAlignment: Text.AlignLeft
                    text: "Po está prestes a se tornar o novo líder espiritual do Vale da Paz, mas antes que possa fazer isso, ele deve encontrar um sucessor para se tornar o novo Dragão Guerreiro. Ele parece encontrar uma em Zhen, uma raposa com muitas habilidades promissoras, mas que não gosta muito da ideia de Po treiná-la."
                    wrapMode: Text.WordWrap
                }
            }
        }
    }
}
