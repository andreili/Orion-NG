#pragma once

class GUI
{
public:
    enum class EActiveScreen
    {
        INFO = 0,
    };

    static void init();
    static void draw();
private:
    static EActiveScreen m_screen;
};
