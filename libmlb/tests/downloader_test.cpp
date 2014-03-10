
#include "../src/downloader.h"
#include "../src/engine.h"
#include <QCoreApplication>

int main(int argc, char *argv[])
{
    EngineCategory().setEnabled(QtDebugMsg, true);
    DownloaderCategory().setEnabled(QtDebugMsg, true);

    QCoreApplication app {argc, argv};
    Q_INIT_RESOURCE(mlb);

    Engine e;
    e.updateArticles();

    return app.exec();
}
