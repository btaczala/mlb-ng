#include "links.h"

#include <QtCore/QFile>
#include <QtCore/QJsonObject>
#include <QtCore/QJsonDocument>

Links::Links(QObject *parent) :
    QObject(parent)
{
    // read embedded default.
    QFile defaultJson {":/links.json"};
    if (!defaultJson.open(QIODevice::ReadOnly)) {
        throw std::runtime_error(defaultJson.errorString().toStdString());
    }
    QJsonDocument doc = QJsonDocument::fromJson(defaultJson.readAll());

    QJsonObject rootObj = doc.object();
    Q_ASSERT(!rootObj.isEmpty());
    m_values = rootObj.toVariantMap();
    Q_ASSERT(m_values.size() != 0);
}

QString Links::allArticlesLink() const noexcept
{
    return m_values["allArticles"].toString();
}

QString Links::articleLink(quint32 id) const noexcept
{
    return m_values["oneArticle"].toString().arg(id);
}
