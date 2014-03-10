#ifndef MLBCORE_ENGINE_H
#define MLBCORE_ENGINE_H

#include <QObject>
#include <QLoggingCategory>

Q_DECLARE_LOGGING_CATEGORY(EngineCategory)

class Article;
class EnginePrivate;
class Engine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<Article*> articles READ articles NOTIFY articlesUpdated)
    Q_PROPERTY(bool networkAvailable READ networkAvailable NOTIFY networkAvailableChanged)
public:
    Engine();
    ~Engine() noexcept;

    Article *article(quint32 id) const noexcept;

public slots:
    // interface
    void updateArticles();
    void fetchSingleArticle(quint32);

    // properties
    QList<Article *> articles() const noexcept;
    bool networkAvailable() const noexcept;

signals:
    void articlesUpdated();
    void networkAvailableChanged();
private:
    Q_DECLARE_PRIVATE(Engine)
    const QScopedPointer<EnginePrivate> d_ptr;
};

#endif // MLBCORE_ENGINE_H
