#ifndef CORE_H
#define CORE_H
#include <QDebug>
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QUrlQuery>
#include <variant>

namespace Core {

struct ShowsModelType {
  QString TvShowImageSource;
  QString TvShowName;
  double TvShowRating;
  QString TvShowContentSummary;
  QString TvShowReleasedDate;
  QJsonArray TvShowGenresList;
};

template <typename... Api> class AppCore {
public:
  using ApiType = std::variant<Api...>;

  explicit AppCore(ApiType api) : _api{std::move(api)} {}

  ShowsModelType singleSearch(const QString &textSearch) {
    ShowsModelType tvShowResult{};
    std::visit([&](auto &&arg) { tvShowResult = arg.singleSearch(textSearch); },
               _api);
    return tvShowResult;
  }

  QList<ShowsModelType> searchShowsByInput(const QString &textSearch) {
    QList<ShowsModelType> showsListResult{};
    std::visit(
        [&](auto &&arg) {
          showsListResult = arg.searchShowsByInput(textSearch);
        },
        _api);
    return showsListResult;
  }

  QList<ShowsModelType> loadAllShows() {
    QList<ShowsModelType> showsListResult{};
    std::visit([&](auto &&arg) { showsListResult = arg.loadAllShows(); }, _api);
    return showsListResult;
  }

  static AppCore &getInstance() {
    static AppCore instance(ApiType{});
    return instance;
  }

private:
  ApiType _api;
};

class ApiTVMaze {
public:
  ShowsModelType singleSearch(const QString &textSearch);
  QList<ShowsModelType> searchShowsByInput(const QString &textSearch);
  QList<ShowsModelType> loadAllShows();

private:
  QString _baseUrl{QStringLiteral("https://api.tvmaze.com/")};

  ShowsModelType convertToModel(const QJsonObject &jsonObject);
  QList<ShowsModelType> convertToModel(const QJsonDocument &json);
};

class HttpClient {
public:
  static QJsonDocument makeGetRequest(const QString &url,
                                      const QUrlQuery &queryParams);
};

} // namespace Core

#endif // CORE_H
