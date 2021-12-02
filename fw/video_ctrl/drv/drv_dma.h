#pragma once
#include <inttypes.h>
#include "core.h"

class DMA
{
public:
    enum class EDirection
    {
        PERIPH_TO_MEMORY = 0,
        MEMORY_TO_PERIPH = DMA_CCR_DIR,
        MEMORY_TO_MEMORY = DMA_CCR_MEM2MEM,
    };
    enum class EPeriphInc
    {
        DISABLE = 0,
        ENABLE = DMA_CCR_PINC,
    };
    enum class EMemInc
    {
        DISABLE = 0,
        ENABLE = DMA_CCR_MINC,
    };
    enum class EPeriphDataAlign
    {
        BYTE = 0,
        HALF_WORD = DMA_CCR_PSIZE_0,
        WORD = DMA_CCR_PSIZE_1,
    };
    enum class EMemhDataAlign
    {
        BYTE = 0,
        HALF_WORD = DMA_CCR_MSIZE_0,
        WORD = DMA_CCR_MSIZE_1,
    };
    enum class EMode
    {
        NORMAL = 0,
        CIRCULAR = DMA_CCR_CIRC,
    };
    enum class EPriority
    {
        LOW = 0,
        MEDIUM = DMA_CCR_PL_0,
        HIGH = DMA_CCR_PL_1,
        VERY_HIGH = DMA_CCR_PL,
    };
    enum class EChannel
    {
        M2M_1 = 1,
        M2M_2,
        M2M_3,
        M2M_4,
        M2M_5,
        M2M_6,
        M2M_7,
        // peripheral, channel 1
        ADC1_0 = 1,
        TIM2_CH3 = 1,
        TIM4_CH1 = 1,
        // peripheral, channel 2
        USART3_TX = 2,
        TIM1_CH1 = 2,
        TIM2_UP = 2,
        TIM3_CH3 = 2,
        SPI1_RX = 2,
        // peripheral, channel 3
        USART3_RX = 3,
        TIM1_CH2 = 3,
        TIM3_CH4 = 3,
        TIM3_UP = 3,
        SPI1_TX = 3,
        // peripheral, channel 4
        USART1_TX = 4,
        TIM1_CH4 = 4,
        TIM1_TRIG = 4,
        TIM1_COM = 4,
        TIM4_CH2 = 4,
        SPI2_RX = 4,
        I2S2_RX = 4,
        I2C2_TX = 4,
        // peripheral, channel 5
        USART1_RX = 5,
        TIM1_UP = 5,
        SPI2_TX = 5,
        I2S_TX = 5,
        TIM2_CH1 = 5,
        TIM4_CH3 = 5,
        I2C2_RX = 5,
        // peripheral, channel 6
        USART2_RX = 6,
        TIM1_CH3 = 6,
        TIM3_CH1 = 6,
        TIM3_TRIG = 6,
        I2C1_TX = 6,
        // peripheral, channel 7
        USART2_TX = 7,
        TIM2_CH2 = 7,
        TIM2_CH4 = 7,
        TIM4_UP = 7,
        I2C1_RX = 7,
    };

    inline void init(uint32_t dma_base, EChannel channel)
    {
        m_dma = (DMA_TypeDef*)dma_base;
        if (dma_base ==  DMA1_BASE)
        {
            switch (channel)
            {
            case EChannel::M2M_1:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel1_BASE);
                break;
            case EChannel::M2M_2:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel2_BASE);
                break;
            case EChannel::M2M_3:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel3_BASE);
                break;
            case EChannel::M2M_4:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel4_BASE);
                break;
            case EChannel::M2M_5:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel5_BASE);
                break;
            case EChannel::M2M_6:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel6_BASE);
                break;
            case EChannel::M2M_7:
                m_channel = reinterpret_cast<DMA_Channel_TypeDef*>(DMA1_Channel7_BASE);
                break;
            default:
                ASSERT(false);
            }
        }
    #ifdef DMA2_BASE
        else if (dma_base == DMA2_BASE)
        {
            #error
        }
    #endif
        //m_channel = (DMA_Channel_TypeDef*)channel_base;
    }

    inline void init_channel(EDirection direction, EPeriphInc per_inc, EMemInc mem_inc, EPeriphDataAlign p_dalign,
                      EMemhDataAlign m_dalign, EMode mode, EPriority priority)
    {
        uint32_t tmp = READ_REG32(&m_channel->CCR);
        tmp &= !(DMA_CCR_PL    | DMA_CCR_MSIZE  | DMA_CCR_PSIZE  |
                DMA_CCR_MINC  | DMA_CCR_PINC   | DMA_CCR_CIRC   |
                DMA_CCR_DIR);
        tmp |= static_cast<uint32_t>(direction) |
            static_cast<uint32_t>(per_inc) |
            static_cast<uint32_t>(mem_inc) |
            static_cast<uint32_t>(p_dalign) |
            static_cast<uint32_t>(m_dalign) |
            static_cast<uint32_t>(mode) |
            static_cast<uint32_t>(priority);
        WRITE_REG32(&m_channel->CCR, tmp);
    }

    void start_IT(void* src_addr, void* dst_addr, uint32_t size);
private:
    DMA_TypeDef*            m_dma;
    DMA_Channel_TypeDef*    m_channel;
};
