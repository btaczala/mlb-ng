#ifndef ENGINE_P_H
#define ENGINE_P_H

#include <QtCore/QObject>
#include "downloader.h"

namespace mlbcore {
class Engine;

class EnginePrivate : public QObject
{
    Q_OBJECT
    Q_DECLARE_PUBLIC(Engine)
public:
    ~EnginePrivate();
private:
    EnginePrivate(Engine *q);

    Engine * const q_ptr;

    QScopedPointer<Downloader> m_pDownloader;
    QObjectList m_articles;
};
}

#endif // ENGINE_P_H
