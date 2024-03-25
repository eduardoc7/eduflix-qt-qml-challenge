import QtQuick
import models
import Components

ApplicationContentDesign {
    id: root

    function loadMainShows() {
        cardListTrending.showsModel.state = ShowsModel.Loading;
        cardListAllShows.showsModel.state = ShowsModel.Loading;
        cardListTrending.showsModel.loadTrendingShows();
        cardListAllShows.showsModel.loadAllShows();
    }

    function openDetailsPopup(model) {
        loaderDetailsPopup.sourceComponent = showDetailsPopupComponent;
        loaderDetailsPopup.item.exTvShowDetailsData = model;
        loaderDetailsPopup.item.open();
    }

    function resetModelToInitialShows() {
        cardListTrending.showsModel.resetModelToInitialShows();
    }

    function searchShowsByInput(searchText) {
        if (searchText === "") {
            return;
        }
        cardListTrending.showsModel.searchShowsByInput(searchText);
    }

    cardListAllShows.onCardPressed: model => openDetailsPopup(model)
    cardListTrending.onCardPressed: model => openDetailsPopup(model)

    Loader {
        id: loaderDetailsPopup

        anchors.centerIn: parent
        width: root.width / 2
    }

    Component {
        id: showDetailsPopupComponent

        ShowDetailsPopup {
            id: detailsPopup

            anchors.centerIn: parent
            width: root.width / 2
        }
    }
}
