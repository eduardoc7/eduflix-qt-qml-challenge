import QtQuick 2.15
import Components

CardDesign {
    id: root

    enum State {
        Active,
        Pressed
    }

    property int _state: Card.State.Active
    property string exTvShowImageSource
    property string exTvShowName: qsTr("Test")
    property string exTvShowRating: qsTr("10.0")

    signal pressed

    tvShowImage.source: exTvShowImageSource !== "" ? exTvShowImageSource : "https://tinyurl.com/tv-missing"
    tvShowName.text: exTvShowName
    tvShowRating.text: exTvShowRating

    states: [
        State {
            name: "Active"
            when: !tapHandler.pressed
        },
        State {
            name: "Pressed"
            when: tapHandler.pressed

            PropertyChanges {
                opacity: 0.5
                target: background
            }

            PropertyChanges {
                opacity: 0.5
                target: tvShowImage
            }
        }
    ]

    TapHandler {
        id: tapHandler

        gesturePolicy: TapHandler.ReleaseWithinBounds
        target: root

        onTapped: root.pressed()
    }
}
