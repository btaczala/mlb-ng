#include "article.h"

#include <tuple>

struct ArticlePrivate
{
    ArticlePrivate(quint32 id, QString title):
        m_data(std::make_tuple(false,id,title, ""))
    {}

    std::tuple<bool, quint32, QString, QString> m_data;
};

Article::Article(quint32 id, QString title, QObject *parent) :
    QObject(parent),
    d_ptr(new ArticlePrivate(id,title))
{
}

Article::~Article()
{
}

quint32 Article::id() const noexcept
{
    Q_D(const Article);
    return std::get<1>(d->m_data);
}

QString Article::title() const noexcept
{
    Q_D(const Article);
    return std::get<2>(d->m_data);
}

bool Article::loaded() const noexcept
{
    Q_D(const Article);
    return std::get<0>(d->m_data);
}

QString Article::text() const noexcept
{
    Q_D(const Article);
    return std::get<3>(d->m_data);
}

void Article::setLoaded(bool b)
{
    Q_D(Article);
    std::get<0>(d->m_data) = b;
    emit loadedChanged();
}

void Article::setText(const QString &text)
{
    Q_D(Article);
    std::get<3>(d->m_data) = text;
    emit textChanged();
}
