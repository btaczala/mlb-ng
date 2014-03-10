#ifndef ENGINETEST_H
#define ENGINETEST_H

#include <QTest>
#include <QSignalSpy>

#include "engine.h"
#include "parser.h"

class EngineTest : public QObject
{
    Q_OBJECT
private slots:
    void initTestCase()
    {
        Q_INIT_RESOURCE(mlb);
        EngineCategory().setEnabled(QtDebugMsg, true);
        ParserCategory().setEnabled(QtDebugMsg, true);
    }

    void checkArticles()
    {
        if (!m_engine.networkAvailable())
            QSKIP("No network connection");
        QSignalSpy mSpy {&m_engine, SIGNAL(articlesUpdated())};
        m_engine.updateArticles();
        QVERIFY(mSpy.wait(30 * 1000));

        QVERIFY(m_engine.articles().size() !=0);
    }

private:
    Engine m_engine;
};

QTEST_MAIN(EngineTest)
#endif // ENGINETEST_H
