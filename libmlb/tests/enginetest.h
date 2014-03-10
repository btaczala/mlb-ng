#ifndef ENGINETEST_H
#define ENGINETEST_H

#include <QTest>
#include <QSignalSpy>

#include "engine.h"
#include "parser.h"
#include "article.h"

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

    void articleListTest()
    {
        if (!m_engine.networkAvailable())
            QSKIP("No network connection");
        QSignalSpy mSpy {&m_engine, SIGNAL(articlesUpdated())};
        m_engine.updateArticles();
        QVERIFY(mSpy.wait(30 * 1000));

        QVERIFY(m_engine.articles().size() !=0);
    }

    void singleArticleTest()
    {
        if (!m_engine.networkAvailable())
            QSKIP("No network connection");
        Article *pA = m_engine.article(41);
        QSignalSpy mSpy {pA, SIGNAL(loadedChanged())};
        m_engine.fetchSingleArticle(41);
        QVERIFY(mSpy.wait(30 * 1000));
    }

private:
    Engine m_engine;
};

QTEST_MAIN(EngineTest)
#endif // ENGINETEST_H
