import QtQuick 2.15
import Components
import QtQuick.Layouts 2.15
import models

Item {
    id: root

    property alias showsModel: showsModel

    Loading {
        id: loading

        visible: showsModel.state === ShowsModel.Loading
    }

    ColumnLayout {
        id: contentColumn

        anchors.fill: root
        spacing: 4

        Text {
            id: titleList

            color: Colors.neutral100
            font: Fonts.heading100
            text: showsModel.titleList
        }

        GridView {
            id: gridView

            Layout.fillHeight: true
            Layout.fillWidth: true
            cellHeight: root.height / 2
            cellWidth: root.width / (root.width > 1000 ? 6.5 : 4.5)
            clip: true
            flow: GridView.FlowTopToBottom
            reuseItems: true

            delegate: Card {
                id: card

                required property string tvShowImageSource
                required property string tvShowName
                required property string tvShowContentSummary
                required property string tvShowReleasedDate
                required property variant tvShowGenresList
                required property double tvShowRating

                exTvShowImageSource: tvShowImageSource
                exTvShowName: tvShowName
                exTvShowRating: tvShowRating.toString()
                width: gridView.cellWidth - 16

                Connections {
                    function onPressed() {
                        createTypeTvShowDetailsDataFromModel({tvShowName, tvShowImageSource, tvShowRating, tvShowContentSummary, tvShowReleasedDate, tvShowGenresList})
                    }

                    target: card
                }
            }
            model: ShowsModel {
                id: showsModel

                titleList: exTitleList
            }
        }
    }
}
