#ifndef ARTICLE_H
#define ARTICLE_H

#include <QObject>

struct ArticlePrivate;
class Article : public QObject
{
    Q_OBJECT
    Q_PROPERTY(quint32 id READ id CONSTANT)
    Q_PROPERTY(QString title READ title CONSTANT)
    Q_PROPERTY(bool loaded READ loaded WRITE setLoaded NOTIFY loadedChanged)
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
public:
    Article(quint32 id, QString title, QObject *parent = 0);
    ~Article();

    quint32 id() const noexcept;
    QString title() const noexcept;
    bool loaded() const noexcept;
    QString text() const noexcept;

    //
    void setLoaded(bool);
    void setText(const QString& text);

signals:
    void loadedChanged();
    void textChanged();

private:
    Q_DISABLE_COPY(Article)
    Q_DECLARE_PRIVATE(Article)
    QScopedPointer<ArticlePrivate> d_ptr;
};

#endif // ARTICLE_H
