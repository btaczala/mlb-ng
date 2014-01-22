#ifndef MLBCORE_ENGINE_H
#define MLBCORE_ENGINE_H

namespace mlbcore {

class Engine
{
public:
    Engine();
    ~Engine() noexcept;

    void fetchArticles() const noexcept;

};

} // namespace mlbcore

#endif // MLBCORE_ENGINE_H
