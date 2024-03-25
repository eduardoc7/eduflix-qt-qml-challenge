import QtQuick 2.15

ShowDetailsPopupDesign {
    id: root

    property TypeTvShowDetails exTvShowDetailsData

    background: Rectangle {
        anchors.bottomMargin: (Screen.height - parent.height - parent.y) * -1
        anchors.fill: parent
        anchors.leftMargin: parent.x * -1
        anchors.rightMargin: (Screen.width - parent.width - parent.x) * -1
        anchors.topMargin: parent.y * -1
        color: "#000000"
        opacity: 0.5
        z: -1
    }
    exit: Transition {
        NumberAnimation {
            duration: 50
            easing.type: Easing.InOutQuad
            from: (parent.height / 2) - (root.height / 2)
            property: "y"
            target: root
            to: -root.height
        }
    }

    closeButton.onPressed: root.close()
    onOpened: {
        if (!exTvShowDetailsData) {
            return;
        }
        contentSummary.text = exTvShowDetailsData.tvShowContentSummary;
        repeaterGenres.model = exTvShowDetailsData.tvShowGenresList;
        tvShowImage.source = exTvShowDetailsData.tvShowImageSource;
        tvShowName.text = exTvShowDetailsData.tvShowName;
        tvShowRating.text = exTvShowDetailsData.tvShowRating;
        tvShowReleasedDate.text = exTvShowDetailsData.tvShowReleasedDate;
    }
}
