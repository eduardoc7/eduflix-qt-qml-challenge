#ifndef SHOWSMODEL_H
#define SHOWSMODEL_H

#include <QAbstractListModel>
#include <QJsonArray>
#include <QJsonObject>
#include <QNetworkAccessManager>
#include <QQmlEngine>
#include <src/core.h>

class ShowsModel : public QAbstractListModel {
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(int state READ state WRITE setState NOTIFY stateChanged FINAL)
  Q_PROPERTY(QString titleList READ titleList WRITE setTitleList NOTIFY
                 titleListChanged FINAL)

public:
  explicit ShowsModel(QObject *parent = nullptr);
  ~ShowsModel() override;

  enum Role {
    TvShowImageSource,
    TvShowName,
    TvShowRating,
    TvShowContentSummary,
    TvShowReleasedDate,
    TvShowGenresList
  };

  enum State { Idle, Loading };
  Q_ENUM(State)

  [[nodiscard]] auto rowCount(const QModelIndex &parent) const -> int override;
  [[nodiscard]] auto data(const QModelIndex &index, int role) const
      -> QVariant override;
  [[nodiscard]] auto roleNames() const -> QHash<int, QByteArray> override;

  Q_INVOKABLE void loadTrendingShows();
  Q_INVOKABLE void loadAllShows();
  Q_INVOKABLE void searchShowsByInput(const QString &inputSearch);
  Q_INVOKABLE void resetModelToInitialShows();

  [[nodiscard]] auto state() const -> int;
  void setState(int state);

  [[nodiscard]] auto titleList() const -> QString;
  void setTitleList(const QString &titleList);

signals:
  void sourceUrlChanged();

  void stateChanged();

  void titleListChanged();

private:
  auto clearModelData() -> void;

  int _state{};
  QString _titleList{QStringLiteral("Trending Now")};
  QUrl _sourceUrl{};
  QList<Core::ShowsModelType> _modelData{};
  QList<Core::ShowsModelType> _modelDataInitialShows{};
};

#endif // SHOWSMODEL_H
