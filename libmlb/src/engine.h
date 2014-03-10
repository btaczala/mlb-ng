#ifndef MLBCORE_ENGINE_H
#define MLBCORE_ENGINE_H

#include <QObject>
namespace mlbcore {

class EnginePrivate;
class Engine : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObjectList articles READ articles NOTIFY articlesUpdated)
public:
    Engine();
    ~Engine() noexcept;

public slots:
    void updateArticles() const;
    QObjectList articles() const noexcept;
signals:
    void articlesUpdated();
private:
    Q_DECLARE_PRIVATE(Engine)
    const QScopedPointer<EnginePrivate> d_ptr;
};

} // namespace mlbcore

#endif // MLBCORE_ENGINE_H
