#pragma once

class App
{
public:
    static void entry_point();
private:
    static void init_core();
    static void preinit_periph();
    static void init_periph();
};
