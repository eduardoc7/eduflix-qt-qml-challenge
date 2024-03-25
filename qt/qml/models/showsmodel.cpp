#include "showsmodel.h"

#include <QEventLoop>
#include <QJsonDocument>
#include <QNetworkReply>
#include <QQmlContext>
#include <QUrlQuery>

ShowsModel::ShowsModel(QObject *parent) : QAbstractListModel(parent) {}

ShowsModel::~ShowsModel() { qInfo() << "ShowsModel::~ShowsModel"; }

auto ShowsModel::rowCount(const QModelIndex &parent) const -> int {
  Q_ASSERT(checkIndex(parent));

  if (parent.isValid()) {
    return 0;
  }

  return static_cast<int>(_modelData.count());
}

auto ShowsModel::roleNames() const -> QHash<int, QByteArray> {
  QHash<int, QByteArray> names;

  names[TvShowImageSource] = "tvShowImageSource";
  names[TvShowName] = "tvShowName";
  names[TvShowRating] = "tvShowRating";
  names[TvShowContentSummary] = "tvShowContentSummary";
  names[TvShowReleasedDate] = "tvShowReleasedDate";
  names[TvShowGenresList] = "tvShowGenresList";

  return names;
}

auto ShowsModel::data(const QModelIndex &index, int role) const -> QVariant {
  if (!index.isValid() || (_modelData.empty())) {
    return {};
  }

  const Core::ShowsModelType showData = _modelData.at(index.row());

  switch (role) {
  case TvShowImageSource:
    return showData.TvShowImageSource;
  case TvShowName:
    return showData.TvShowName;
  case TvShowRating:
    return showData.TvShowRating;
  case TvShowContentSummary:
    return showData.TvShowContentSummary;
  case TvShowReleasedDate:
    return showData.TvShowReleasedDate;
  case TvShowGenresList:
    return showData.TvShowGenresList;
  default:
    return {};
  }

  return {};
}

void ShowsModel::loadTrendingShows() {
  static constexpr std::array<const char *, 10> trendingShowList{
      {"The Office", "Breaking Bad", "The Big Bang Theory", "The Walking Dead",
       "Stranger Things", "Loki", "Game of Thrones", "The Last of Us",
       "House of Dragons", "The Boys"}};

  setState(State::Loading);

  for (const auto &tvShowName : trendingShowList) {
    const auto resultShow =
        Core::AppCore<Core::ApiTVMaze>::getInstance().singleSearch(
            QString::fromLatin1(tvShowName));
    beginInsertRows(QModelIndex(), _modelData.size(), _modelData.size());

    _modelData << resultShow;

    endInsertRows();
  }

  _modelDataInitialShows = _modelData;

  setState(State::Idle);
}

void ShowsModel::loadAllShows() {
  setState(State::Loading);

  const auto resultShowsList =
      Core::AppCore<Core::ApiTVMaze>::getInstance().loadAllShows();

  beginResetModel();
  _modelData = resultShowsList;
  endResetModel();

  setState(State::Idle);
}

void ShowsModel::searchShowsByInput(const QString &inputSearch) {
  setState(State::Loading);

  clearModelData();

  const auto resultShowsList =
      Core::AppCore<Core::ApiTVMaze>::getInstance().searchShowsByInput(
          inputSearch);

  beginResetModel();
  _modelData = resultShowsList;
  endResetModel();

  if (resultShowsList.isEmpty()) {
    setTitleList(QStringLiteral("No Search Results"));
  } else {
    setTitleList(QStringLiteral("Search Results"));
  }

  setState(State::Idle);
}

void ShowsModel::resetModelToInitialShows() {
  setState(State::Loading);

  setTitleList(QStringLiteral("Trending Now"));

  beginResetModel();

  _modelData = _modelDataInitialShows;

  endResetModel();

  setState(State::Idle);
}

auto ShowsModel::clearModelData() -> void {
  beginResetModel();

  _modelData.clear();

  endResetModel();
}

auto ShowsModel::titleList() const -> QString { return _titleList; }

void ShowsModel::setTitleList(const QString &titleList) {
  if (_titleList == titleList) {
    return;
  }
  _titleList = titleList;
  emit titleListChanged();
}

auto ShowsModel::state() const -> int { return _state; }

void ShowsModel::setState(int state) {
  if (_state == state) {
    return;
  }
  _state = state;
  emit stateChanged();
}
