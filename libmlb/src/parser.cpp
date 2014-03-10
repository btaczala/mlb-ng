#include "parser.h"
#include <QLoggingCategory>
#include <htmlcxx/html/ParserDom.h>

Q_LOGGING_CATEGORY(ParserCategory, "mlb.parser")

namespace {
typedef std::pair<bool, std::string> NodeAttribute_t ;
std::uint32_t id( htmlcxx::HTML::Node& node )
{
    std::uint32_t idToRet = -1;
    bool bCast=false ;
    if ( node.tagName() == "a") {
        node.parseAttributes();
        // now let's get article id
        const NodeAttribute_t & hrefAttr = node.attribute("href");
        const QString hrefStr = QString::fromStdString(hrefAttr.second);
        QStringList a = hrefStr.split("artykul=");
        if (a.count() != 2 )
            qCritical() << "Bla!";
        const QString id = a[1];
        QStringList comments = id.split("#");
        if (comments.count() != 1 && comments.count() != 2 )
            qCritical() << "Bla!";

        if ( comments.size() == 1 ) {
            idToRet = comments.at(0).toInt(&bCast);
        }
        else {
            idToRet = comments.at(0).toInt(&bCast);
        }
    }
    if (!bCast)
        qWarning() << "Hmm something went wrong";
    return idToRet ;
}
}

Parser::Parser(QObject *parent) :
    QObject(parent)
{
}

QList<Parser::Article_t> Parser::parseArticlesList(const QByteArray &ba)
{
    QList<Parser::Article_t> ret;

    if (ba.isEmpty()) {
        qCWarning(ParserCategory()) << "Unable to work with empty data";
        return ret;
    }

    qCDebug(ParserCategory()) << "Started parsing";
    qint32 lastID ;
    htmlcxx::HTML::ParserDom parser;
    const std::string htmlStr (ba.data());
    tree<htmlcxx::HTML::Node> dom = parser.parseTree(htmlStr);

    // find div, that has <hr1> with Lista ... </hr1>
    enum class TagSearch {
        eSpan = 0,
        eArticleID,
        eArticleTitle
    } currentTag = TagSearch::eSpan ;

    for( htmlcxx::HTML::Node i: dom )
    {
        switch(currentTag)
        {
        case TagSearch::eSpan:
            if ( i.tagName() == "span") {
                i.parseAttributes();
                const NodeAttribute_t & tmp = i.attribute("style");
                if ( tmp.first ) {
                    if ( tmp.second == "margin-top:3px;") {
                        currentTag = TagSearch::eArticleID ;
                    }
                }
            }
            break;

        case TagSearch::eArticleID:
            lastID = id(i);
            currentTag = TagSearch::eArticleTitle;
            break ;
        case TagSearch::eArticleTitle:
            qCDebug(ParserCategory()) << "Article id=" << lastID << " title=" <<QString::fromStdString(i.tagName());
            ret.append(std::make_tuple(lastID, QString::fromStdString(i.tagName())));
            currentTag = TagSearch::eSpan ;
            break ;
        }
    }
    qCDebug(ParserCategory()) << "Finished parsing";

    return ret;
}
