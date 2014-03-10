#ifndef LINKS_H
#define LINKS_H

#include <QObject>
#include <QtCore/QVariantMap>

class Links : public QObject
{
    Q_OBJECT
public:
    explicit Links(QObject *parent = 0);

    QString allArticlesLink() const noexcept;
private:
    QVariantMap m_values;
};

#endif // LINKS_H
