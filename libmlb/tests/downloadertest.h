#ifndef DOWNLOADERTEST_H
#define DOWNLOADERTEST_H

#include <QtTest>
#include "downloader.h"
class DownloaderTest : public QObject
{
    Q_OBJECT
private slots:
    void initTestCase()
    {
    }

    void testSimpleDownload()
    {
        if (!m_downloader.networkAvailable())
            QSKIP("Network not accessible");
    }
private:
    Downloader m_downloader;
};


QTEST_MAIN(DownloaderTest)

#endif // DOWNLOADERTEST_H
