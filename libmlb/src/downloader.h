#ifndef MLBCORE_DOWNLOADER_H
#define MLBCORE_DOWNLOADER_H

#include <QtCore/QObject>
#include <QtCore/QUuid>
#include <QtCore/QLoggingCategory>

Q_DECLARE_LOGGING_CATEGORY(DownloaderCategory)

class DownloaderPrivate;
class Downloader : public QObject
{
    Q_OBJECT
public:
    explicit Downloader(QObject *parent = 0);
    ~Downloader();
public slots:
    QUuid get(const QString& url);

    bool networkAvailable() const noexcept;

signals:
    void dataReady(QUuid id, QByteArray data);
    void error();
private:
    Q_DECLARE_PRIVATE(Downloader)
    QScopedPointer<DownloaderPrivate> d_ptr;
};

#endif // MLBCORE_DOWNLOADER_H
