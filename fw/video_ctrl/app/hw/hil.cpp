#include "hil.h"
#include "drv_flash.h"
#include "drv_nvic.h"
#include "drv_rcc.h"
#include "drv_uart.h"
#include "drv_gpio.h"
#include "drv_afio.h"
#include "drv_i2c.h"
#include "drv_spi.h"
#include "drv_dma.h"

#include "uart_fifo.h"
#include "utils.h"
#ifdef DEBUG
#include "xprintf.h"
#include "shell.h"
#endif
#include <cstring>

#ifdef DEBUG
CUART uart1;
#endif
CGPIO gpioa;
static CGPIO gpiob;
CI2C i2c1;
CI2C i2c2;
CSPI spi1;
DMA dma_i2c2_tx, dma_i2c2_rx;
//CUSBD usbd_HS;
//CUSBDCDC usb_cdc;

uint8_t HIL::m_spi_tx_buf[SPI_BUF_SIZE];
uint8_t HIL::m_spi_rx_buf[SPI_BUF_SIZE];

#ifdef DEBUG
void xfunc_out(unsigned char ch)
{
    //uart1.send_char(ch);
    uart_fifo.tx_push(ch);
    if ((!uart1.is_tx_busy()) && (!uart_fifo.tx_empty()))
    {
        uart1.send_start_IT(uart_fifo.tx_pop());
    }
}
#endif

void HIL::init()
{
    init_core();
    preinit_periph();
    init_periph();
}

void HIL::idle_proc()
{
#ifdef DEBUG
    char ch = uart_fifo.rx_pop();
    if (ch != '\0')
    {
        shell.process_char(ch);
    }
#endif
}

void HIL::pl_get_registers(uint32_t from_addr, uint8_t *p_data, uint32_t count)
{
    m_spi_tx_buf[0] = from_addr;
    m_spi_tx_buf[1] = count;

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    spi1.transmit_receive(m_spi_tx_buf, m_spi_rx_buf, count + 2, 1000);
    memcpy(p_data, &m_spi_rx_buf[2], count);
    gpioa.pin_UP(EGPIOPins::PIN_3);
}

void HIL::pl_set_registers(uint32_t from_addr, uint8_t *p_data, uint32_t count)
{
    m_spi_tx_buf[0] = (1 << 7) | from_addr;
    m_spi_tx_buf[1] = count;

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    if (p_data != nullptr)
    {
        memcpy(&m_spi_tx_buf[2], p_data, count);
    }
    spi1.transmit_receive(m_spi_tx_buf, m_spi_rx_buf, count + 2, 1000);
    gpioa.pin_UP(EGPIOPins::PIN_3);
}

bool HIL::get_edid(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count)
{
    if (i2c1.master_transmit(dev_addr, &offset, 1, 1000, true))
    {
        if (i2c1.master_receive(dev_addr, p_data, count, 1000))
        {
            return true;
        }
    }
    return false;
}

bool HIL::get_tfp(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count)
{
    if (i2c2.master_transmit(dev_addr, &offset, 1, 1000, true))
    {
        if (i2c2.master_receive(dev_addr, p_data, count, 1000))
        {
            return true;
        }
    }
    return false;
}

bool HIL::set_tfp(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count)
{
    if (i2c2.master_transmit(dev_addr, &offset, 1, 1000, true))
    {
        if (i2c2.master_transmit(dev_addr, p_data, count, 1000, false))
        {
            return true;
        }
    }
    return false;
}

void HIL::display_command(uint32_t dev_addr, uint8_t* p_data, uint32_t size)
{
    if (!i2c2.master_transmit(dev_addr, p_data, size, 100, false))
    {
        ASSERT(false);
    }
}

void HIL::display_update(uint32_t dev_addr, uint8_t* p_data, uint32_t size)
{
    if (!i2c2.is_busy())
    {
        //i2c2.master_transmit_DMA(dev_addr, p_data, size, false);
        i2c2.master_transmit(dev_addr, p_data, size, 1000, false);
    }
}

void HIL::init_core()
{
    CFLASH::prefetch_enable();
    CNVIC::init();
    CRCC::update_sys_clk();
    Utils::timer_init();
    CRCC::init();
}

void HIL::preinit_periph()
{
    CRCC::set_clk_APB1_enabled(EPeriph::APB1_I2C1 | EPeriph::APB1_I2C2, true);
    CRCC::set_clk_APB2_enabled(EPeriph::APB2_AFIO | EPeriph::APB2_GPIOA | EPeriph::APB2_GPIOB |
        EPeriph::APB2_USART1 | APB2_SPI1, true);

    gpioa.init(GPIOA);
    gpiob.init(GPIOB);
    // USBEN pin
    gpioa.init_pins(EGPIOPins::PIN_8, EGPIOMode::OUTPUT_PP, EGPIOPull::PULLDOWN, EGPIOSpeed::HIGH);
    // USART1 pins
    gpioa.init_pins(EGPIOPins::PIN_9, EGPIOMode::AF_PP, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);
    gpioa.init_pins(EGPIOPins::PIN_10, EGPIOMode::INPUT, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);

    // I2C1 and I2C2 pins
    gpiob.init_pins(EGPIOPins::PIN_6 | EGPIOPins::PIN_7 | EGPIOPins::PIN_10 | EGPIOPins::PIN_11,
        EGPIOMode::AF_OD, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);
    // SPI1 pins
    /*gpioa.init_pins(EGPIOPins::PIN_5, EGPIOMode::INPUT, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);
    gpioa.init_pins(EGPIOPins::PIN_4 | EGPIOPins::PIN_6 | EGPIOPins::PIN_7, EGPIOMode::AF_PP,
        EGPIOPull::NOPULL, EGPIOSpeed::HIGH);*/
    gpioa.init_pins(EGPIOPins::PIN_6, EGPIOMode::INPUT, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);
    gpioa.init_pins(EGPIOPins::PIN_5 | EGPIOPins::PIN_7, EGPIOMode::AF_PP, EGPIOPull::NOPULL, EGPIOSpeed::HIGH);
    gpioa.init_pins(EGPIOPins::PIN_3, EGPIOMode::OUTPUT_PP, EGPIOPull::PULLUP, EGPIOSpeed::HIGH);

    gpioa.pin_UP(EGPIOPins::PIN_3);

    // GPIO
    gpioa.init_pins(EGPIOPins::PIN_0, EGPIOMode::OUTPUT_PP, EGPIOPull::PULLUP, EGPIOSpeed::HIGH);
    gpioa.pin_UP(EGPIOPins::PIN_0);

    CAFIO::remap_swj_nojtag();

    dma_i2c2_tx.init(DMA1_BASE, DMA::EChannel::I2C2_TX);
    dma_i2c2_tx.init_channel(DMA::EDirection::MEMORY_TO_PERIPH, DMA::EPeriphInc::DISABLE,
        DMA::EMemInc::ENABLE, DMA::EPeriphDataAlign::BYTE, DMA::EMemhDataAlign::BYTE,
        DMA::EMode::NORMAL, DMA::EPriority::MEDIUM);

    dma_i2c2_rx.init(DMA1_BASE, DMA::EChannel::I2C2_RX);
    dma_i2c2_rx.init_channel(DMA::EDirection::PERIPH_TO_MEMORY, DMA::EPeriphInc::DISABLE,
        DMA::EMemInc::ENABLE, DMA::EPeriphDataAlign::BYTE, DMA::EMemhDataAlign::BYTE,
        DMA::EMode::NORMAL, DMA::EPriority::MEDIUM);
}

void HIL::init_periph()
{
#ifdef DEBUG
    uart1.init(USART1);
    CORTEX::NVIC::enable_IRQ(USART1_IRQn);
    uart1.recv_start_IT();
#endif

    i2c1.init(I2C1, 400 * 1000, EI2CDuty::CYCLE_2);
    i2c2.init(I2C2, 400 * 1000, EI2CDuty::CYCLE_2);

    spi1.init(SPI1);

    //usbd_HS.init();
    //usbd_HS.register_class(&usb_cdc);
}

void ISR::USB_LP_CAN1_RX0_IRQ()
{
    //usbd_HS.PCD_irq_handler();
}

#ifdef DEBUG
static uint8_t i2c_buf[256];
static uint8_t spi_tx_buf[50];
static uint8_t spi_rx_buf[50];

status_e cmd_i2c_recv(uint32_t argc, char * const argv[])
{
    if (argc != 5)
    {
        return STATUS_INV_PAR;
    }
    uint32_t id = Shell::get_num(argv[1]);
    uint32_t addr = Shell::get_num(argv[2]);
    uint32_t offset = Shell::get_num(argv[3]);
    uint32_t size = Shell::get_num(argv[4]);
    if (size > 256)
    {
        xprintf("Buffer size must be lower 256!\n");
        return STATUS_INV_PAR;
    }
    CI2C* p_i2c;
    if (id == 1)
    {
        p_i2c = &i2c1;
    }
    else
    {
        p_i2c = &i2c2;
    }

    if (!p_i2c->master_transmit(addr, (uint8_t*)&offset, 1, 1000, true))
    {
        return STATUS_FAIL;
    }
    if (!p_i2c->master_receive(addr, i2c_buf, size, 1000))
    {
        return STATUS_FAIL;
    }

    xprintf("Received data\n");
    for (uint32_t i=0 ; i<size ; ++i)
    {
        if ((i % 16) == 0)
        {
            xprintf("\n0x%04x: ", i);
        }
        xprintf("0x%02x ", i2c_buf[i]);
    }
    xfunc_out('\n');
    return STATUS_OK;
}

SHELL_COMMAND(i2c_recv, "[id=1/2] [addr=0..127] [offset] [size]", cmd_i2c_recv);

status_e cmd_dump_vreg(uint32_t argc, char * const argv[])
{
    uint32_t size = 14;
    (void)(argc);
    (void)(argv);
    spi_tx_buf[0] = (0 << 7) | 0;
    spi_tx_buf[1] = size;

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    if (!spi1.transmit_receive(spi_tx_buf, spi_rx_buf, size + 2, 1000))
    {
        gpioa.pin_UP(EGPIOPins::PIN_3);
        return STATUS_FAIL;
    }
    gpioa.pin_UP(EGPIOPins::PIN_3);

    xprintf("Received data\n");
    for (uint32_t i=0 ; i<(size+2) ; ++i)
    {
        if ((i % 16) == 0)
        {
            xprintf("\n0x%04x: ", i);
        }
        xprintf("0x%02x ", spi_rx_buf[i]);
    }
    xfunc_out('\n');
    return STATUS_OK;
}

SHELL_COMMAND(dump_vreg, "", cmd_dump_vreg);

#include "edid_ctrl.h"
status_e cmd_fpga_reset(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    gpioa.pin_DOWN(EGPIOPins::PIN_0);
    uint32_t delay_to = Utils::get_tick() + 1;
    while (delay_to > Utils::get_tick());
    gpioa.pin_UP(EGPIOPins::PIN_0);
    CEDIDCtrl::reset();
    return STATUS_OK;
}

SHELL_COMMAND(fpga_reset, "", cmd_fpga_reset);
#endif
