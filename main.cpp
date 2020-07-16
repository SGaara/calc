#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <api.h>


int main(int argc, char *argv[]) {
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    }

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    API api;

    qmlRegisterSingletonType<API>("API", 1, 0, "API", [&api](QQmlEngine *engine, QJSEngine *scriptEngine)->QObject*{
        Q_UNUSED(engine)
        Q_UNUSED(scriptEngine)
        return &api;
    });

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
