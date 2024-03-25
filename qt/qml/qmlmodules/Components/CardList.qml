import QtQuick 2.15

CardListDesign {
    id: root

    property string exTitleList: ""

    signal cardPressed(TypeTvShowDetails model)

    function createTypeTvShowDetailsDataFromModel(model) {
        tvShowDetailsData.tvShowName = model.tvShowName;
        tvShowDetailsData.tvShowImageSource = model.tvShowImageSource !== "" ? model.tvShowImageSource : "https://tinyurl.com/tv-missing";
        tvShowDetailsData.tvShowRating = model.tvShowRating;
        tvShowDetailsData.tvShowContentSummary = model.tvShowContentSummary;
        tvShowDetailsData.tvShowReleasedDate = model.tvShowReleasedDate;
        tvShowDetailsData.tvShowGenresList = model.tvShowGenresList;
        root.cardPressed(tvShowDetailsData);
    }

    TypeTvShowDetails {
        id: tvShowDetailsData

    }
}
