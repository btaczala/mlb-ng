#ifndef ENGINE_P_H
#define ENGINE_P_H

#include <QtCore/QObject>
#include "downloader.h"
#include "links.h"
#include "parser.h"

class Engine;
class Article;
class EnginePrivate : public QObject
{
    Q_OBJECT
    Q_DECLARE_PUBLIC(Engine)
public:
    ~EnginePrivate();
private:
    EnginePrivate(Engine *q);

    void articlesRefreshed(QUuid, QByteArray);
    void articleRefreshed(QUuid, QByteArray);

    Engine * const q_ptr;
    Downloader m_downloader;
    QList<Article*> m_articles;
    Links m_links;
    Parser m_parser;
    Article* m_currentArticle {nullptr};
};

#endif // ENGINE_P_H
