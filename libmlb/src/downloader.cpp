#include "downloader.h"
#include "downloader_p.h"

#include <QtCore/QDebug>
#include <QtNetwork/QNetworkRequest>
#include <QtNetwork/QNetworkReply>

Q_LOGGING_CATEGORY(DownloaderCategory, "mlb.downloader")

Downloader::Downloader(QObject *parent)
    : QObject(parent), d_ptr(new DownloaderPrivate(this))
{
//    connect(&(d_ptr->m_networkManager), &(QNetworkAccessManager::readyRead),this, &Downloader::dataReady);
}

Downloader::~Downloader()
{
}

QUuid Downloader::get(const QString &url)
{
    Q_D(Downloader);
    qCDebug(DownloaderCategory) << "Downloading " << url;
    QNetworkRequest req{ url };
    QNetworkReply *pR = d->m_networkManager.get(req);
    connect(pR, &QNetworkReply::readyRead, d, &DownloaderPrivate::dataReady);
    connect(pR, &QNetworkReply::finished, d, &DownloaderPrivate::finished);
    connect(pR, static_cast<void (QNetworkReply::*)(QNetworkReply::NetworkError)>(&QNetworkReply::error), d, &DownloaderPrivate::error);
    d->m_lastId = QUuid::createUuid();
    return d->m_lastId;
}

bool Downloader::networkAvailable() const noexcept
{
    Q_D(const Downloader);
    return d->m_networkManager.networkAccessible() == QNetworkAccessManager::Accessible;
}


void DownloaderPrivate::dataReady()
{
    qCDebug(DownloaderCategory()) << "new data ";
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());
    m_currentData.append(reply->readAll());
//    emit q->dataReady(m_lastId, reply->readAll());
}

void DownloaderPrivate::error(QNetworkReply::NetworkError ec)
{
    Q_Q(Downloader);
    emit q->error();
}

void DownloaderPrivate::finished()
{
    Q_Q(Downloader);
    emit q->dataReady(m_lastId, m_currentData);
}
