#include "engine.h"
#include "engine_p.h"
#include "downloader.h"

namespace mlbcore {

EnginePrivate::EnginePrivate(Engine *q):
    q_ptr(q),
    m_pDownloader(new Downloader)
{
}

EnginePrivate::~EnginePrivate()
{
}

Engine::Engine()
{
}

Engine::~Engine()
{
}

void Engine::updateArticles() const
{
    Q_D(const Engine);

    // call Downloader::get
    // clear old articles
}

QObjectList Engine::articles() const noexcept
{
    Q_D(const Engine);
    return d->m_articles;
}

} // namespace mlbcore
