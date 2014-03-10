#ifndef PARSER_H
#define PARSER_H

#include <QObject>
#include <QLoggingCategory>
#include <tuple>

Q_DECLARE_LOGGING_CATEGORY(ParserCategory)

class Parser : public QObject
{
    Q_OBJECT
public:
    typedef std::tuple<quint32,QString> Article_t;
    explicit Parser(QObject *parent = 0);

    enum class ParserType {
        eAllArticles=0
    };

    QList<Article_t> parseArticlesList(const QByteArray &ba);

};

#endif // PARSER_H
