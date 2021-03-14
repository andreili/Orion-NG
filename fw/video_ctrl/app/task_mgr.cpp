#include "task_mgr.h"
#include "utils.h"

CTaskMgr::task_t CTaskMgr::m_tasks[MAX_TASK_COUNT];

void CTaskMgr::init()
{
    for (uint32_t i=0 ; i<MAX_TASK_COUNT ; ++i)
    {
        task_t* p_task = &m_tasks[i];
        p_task->body = nullptr;
    }
}

void CTaskMgr::run()
{
    uint32_t current_ts = Utils::get_tick();
    for (uint32_t i=0 ; i<MAX_TASK_COUNT ; ++i)
    {
        task_t* p_task = &m_tasks[i];
        if (p_task->body != nullptr)
        {
            if (p_task->next_run_ts <= current_ts)
            {
                p_task->body();
                p_task->next_run_ts = current_ts + static_cast<uint32_t>(p_task->interval);
            }
        }
    }
}

void CTaskMgr::add_task(void(*task)(), EInterval interval)
{
    for (uint32_t i=0 ; i<MAX_TASK_COUNT ; ++i)
    {
        task_t* p_task = &m_tasks[i];
        if (p_task->body == nullptr)
        {
            p_task->body = task;
            p_task->interval = interval;
            p_task->next_run_ts = 0;
            break;
        }
    }
}
