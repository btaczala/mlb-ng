#include "engine.h"
#include "engine_p.h"
#include "downloader.h"
#include "article.h"

#include <QtDebug>
#include <QtCore/QUuid>
#include <QtConcurrent/QtConcurrentRun>

Q_LOGGING_CATEGORY(EngineCategory, "mlb.engine")

namespace
{
}

EnginePrivate::EnginePrivate(Engine *q) : q_ptr(q), m_downloader()
{
}

void EnginePrivate::articlesRefreshed(QUuid id, QByteArray ba)
{
    qCDebug(EngineCategory) << "Articles are refreshed";
    disconnect(&m_downloader, &Downloader::dataReady, this,
               &EnginePrivate::articlesRefreshed);
    QList<Parser::Article_t> articles = m_parser.parseArticlesList(ba);
    qDeleteAll(m_articles);
    m_articles.clear();

    std::for_each(articles.begin(), articles.end(), [&](typename Parser::Article_t article){
        m_articles.append(new Article(std::get<0>(article), std::get<1>(article)));

    });
    Q_Q(Engine);
    emit q->articlesUpdated();
}

EnginePrivate::~EnginePrivate()
{
}

Engine::Engine():
    d_ptr(new EnginePrivate(this))
{
}

Engine::~Engine()
{
}

void Engine::updateArticles()
{
    Q_D(Engine);

    qCDebug(EngineCategory) << "Updating list of articles";

    // call Downloader::get
    // clear old articles
    connect(&(d->m_downloader), &Downloader::dataReady, d,
            &EnginePrivate::articlesRefreshed);
    QUuid id = d->m_downloader.get(d->m_links.allArticlesLink());
    qCDebug(EngineCategory) << "Update scheduled";
}

QList<Article*> Engine::articles() const noexcept
{
    Q_D(const Engine);
    return d->m_articles;
}

bool Engine::networkAvailable() const noexcept
{
    Q_D(const Engine);
    return d->m_downloader.networkAvailable();
}
