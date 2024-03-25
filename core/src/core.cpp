#include "core.h"

#include <QEventLoop>
#include <QJsonDocument>
#include <QNetworkReply>

auto Core::HttpClient::makeGetRequest(const QString &url,
                                      const QUrlQuery &queryParams)
    -> QJsonDocument {
  QUrl baseUrl(url);
  baseUrl.setQuery(queryParams);

  static auto *networkAcessMananger = new QNetworkAccessManager{};

  const QNetworkRequest request(baseUrl);
  QNetworkReply *reply = networkAcessMananger->get(request);

  static constexpr unsigned int HTTP_SUCCESS_CODE = 200;

  QEventLoop loop;
  QObject::connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);

  loop.exec();

  if (reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toUInt() !=
      HTTP_SUCCESS_CODE) {
    qCritical() << "makeGetRequest ERROR"
                << QJsonDocument::fromJson(reply->readAll());
    return {};
  }

  QJsonDocument response = QJsonDocument::fromJson(reply->readAll());
  reply->deleteLater();

  return response;
}

Core::ShowsModelType Core::ApiTVMaze::singleSearch(const QString &textSearch) {
  QUrl baseUrl(_baseUrl);
  baseUrl.setPath(baseUrl.path() + "singlesearch/shows");

  QUrlQuery query;
  query.addQueryItem(QStringLiteral("q"), textSearch);

  auto response = HttpClient::makeGetRequest(baseUrl.toString(), query);
  return convertToModel(response.object());
}

QList<Core::ShowsModelType>
Core::ApiTVMaze::searchShowsByInput(const QString &textSearch) {
  QUrl baseUrl(_baseUrl);
  baseUrl.setPath(baseUrl.path() + "/search/shows");

  QUrlQuery query;
  query.addQueryItem(QStringLiteral("q"), textSearch);

  auto response = HttpClient::makeGetRequest(baseUrl.toString(), query);
  return convertToModel(response);
}

QList<Core::ShowsModelType> Core::ApiTVMaze::loadAllShows() {
  QUrl baseUrl(_baseUrl);
  baseUrl.setPath(baseUrl.path() + "/shows");

  auto response = HttpClient::makeGetRequest(baseUrl.toString(), {});

  return convertToModel(response);
}

Core::ShowsModelType
Core::ApiTVMaze::convertToModel(const QJsonObject &jsonObject) {
  ShowsModelType model;
  model.TvShowImageSource = jsonObject.value(QStringLiteral("image"))
                                .toObject()
                                .value(QStringLiteral("medium"))
                                .toString();
  model.TvShowName = jsonObject.value(QStringLiteral("name")).toString();
  model.TvShowRating = jsonObject.value(QStringLiteral("rating"))
                           .toObject()
                           .value(QStringLiteral("average"))
                           .toDouble();
  model.TvShowContentSummary =
      jsonObject.value(QStringLiteral("summary")).toString();
  model.TvShowReleasedDate =
      jsonObject.value(QStringLiteral("premiered")).toString();
  model.TvShowGenresList = jsonObject.value(QStringLiteral("genres")).toArray();
  return model;
}

QList<Core::ShowsModelType>
Core::ApiTVMaze::convertToModel(const QJsonDocument &json) {
  QList<ShowsModelType> showsList;

  if (json.isObject()) {
    showsList.push_back(convertToModel(json.object()));
    return showsList;
  }

  showsList.reserve(json.array().size());
  for (const auto &jsonValue : json.array()) {
    QJsonObject jsonObject =
        jsonValue.toObject().value(QStringLiteral("score")).isUndefined()
            ? jsonValue.toObject()
            : jsonValue.toObject().value(QStringLiteral("show")).toObject();
    showsList.push_back(convertToModel(jsonObject));
  }

  return showsList;
}
