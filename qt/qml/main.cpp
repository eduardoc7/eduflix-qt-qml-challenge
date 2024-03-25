#include <QFile>
#include <QFont>
#include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include <QQuickImageProvider>
#include <QResource>

auto main(int argc, char *argv[]) -> int {
  QGuiApplication app(argc, argv);

  QGuiApplication::setFont(QFont(QStringLiteral("Roboto")));
  QGuiApplication::setOrganizationDomain(QStringLiteral(""));
  QGuiApplication::setOrganizationName(QStringLiteral(""));
  QGuiApplication::setApplicationName(QStringLiteral("Eduflix Qt QML"));
  QGuiApplication::setApplicationDisplayName(QStringLiteral("Eduflix Qt QML"));
  QGuiApplication::setApplicationVersion(QStringLiteral("1.0"));

  QQmlApplicationEngine engine;
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreationFailed, &app,
      []() { QCoreApplication::exit(-1); },

      Qt::QueuedConnection);

  engine.loadFromModule("main", "Main");

  return QGuiApplication::exec();
}
