#include "downloader.h"
#include "downloader_p.h"

#include <QtCore/QDebug>

namespace mlbcore {

Downloader::Downloader(QObject *parent) :
    QObject(parent),
    d_ptr(new DownloaderPrivate)
{
}

Downloader::~Downloader()
{
}

void Downloader::get(const QString &url)
{
    qDebug() << "Downloader" << "fetching " << url;
}

} // namespace mlbcore
