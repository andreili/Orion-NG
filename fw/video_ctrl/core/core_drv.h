#pragma once

enum class EState : uint32_t
{
    RESET = 0,
    READY,
    BUSY,
    BUSY_TX,
    BUSY_RX,
    BUSY_TX_RX,
    TIMEOUT,
    ERROR,
    OK,
};

enum class ELock : uint32_t
{
    UNLOCKED = 0,
    LOCKED,
};

enum class EErrorCode : uint32_t
{
    NONE,
};

typedef void (*callback_t)(void);

#define DRV_LOCK(lock) { while (lock==ELock::LOCKED) {}; lock = ELock::LOCKED; }
#define DRV_UNLOCK(lock) { lock = ELock::UNLOCKED; }
