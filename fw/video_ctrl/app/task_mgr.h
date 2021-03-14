#pragma once

#include <cstdint>

#define MAX_TASK_COUNT 5

class CTaskMgr
{
public:
    enum class EInterval: uint32_t
    {
        MS_1    = 1,
        MS_10   = 10,
        MS_100  = 100,
        MS_1000 = 1000,
    };
    static void init();
    static void run();
    static void add_task(void(*task)(), EInterval interval);
private:
    typedef struct
    {
        EInterval   interval;
        uint32_t    next_run_ts;
        void(*body)();
    } task_t;
    static task_t m_tasks[MAX_TASK_COUNT];
};
