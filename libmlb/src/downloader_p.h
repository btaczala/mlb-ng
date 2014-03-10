#ifndef DOWNLOADER_P_H
#define DOWNLOADER_P_H

#include <QtCore/QObject>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QtCore/QUuid>

class Downloader;
class DownloaderPrivate : public QObject {
    Q_OBJECT
    Q_DECLARE_PUBLIC(Downloader)
public:
    DownloaderPrivate(Downloader *q):
        q_ptr(q)
    {}
private:
    QNetworkAccessManager m_networkManager;
    Downloader *q_ptr;
    QUuid m_lastId;
    QByteArray m_currentData;
private slots:
    void dataReady();
    void error(QNetworkReply::NetworkError ec);
    void finished();
};

#endif // DOWNLOADER_P_H
