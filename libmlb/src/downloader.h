#ifndef MLBCORE_DOWNLOADER_H
#define MLBCORE_DOWNLOADER_H

#include <QObject>

namespace mlbcore {

class DownloaderPrivate;
class Downloader : public QObject
{
    Q_OBJECT
public:
    explicit Downloader(QObject *parent = 0);
    ~Downloader();
public slots:
    void get(const QString& url);
signals:
    void dataReady();
private:
    Q_DECLARE_PRIVATE(Downloader)
    QScopedPointer<DownloaderPrivate> d_ptr;
};

} // namespace mlbcore

#endif // MLBCORE_DOWNLOADER_H
