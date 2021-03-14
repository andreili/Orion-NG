#include "usbd.h"
#include "drv_rcc.h"

void CUSBD::init()
{
    m_class = nullptr;
    m_dev_endpoints = 8;
    m_speed = EUSBSpeed::HIGH;
    PCD_init();
    /* USER CODE BEGIN EndPoint_Configuration */
    PCD_PMA_config(0x00 , EKind::SNG_BUF, 0x18);
    PCD_PMA_config(0x80 , EKind::SNG_BUF, 0x58);
    /* USER CODE END EndPoint_Configuration */
    /* USER CODE BEGIN EndPoint_Configuration_CDC */
    PCD_PMA_config(0x81 , EKind::SNG_BUF, 0xC0);
    PCD_PMA_config(0x01 , EKind::SNG_BUF, 0x110);
    PCD_PMA_config(0x82 , EKind::SNG_BUF, 0x100);
    /* USER CODE END EndPoint_Configuration_CDC */
}

void CUSBD::PCD_irq_handler()
{
    uint32_t int_val = CUSB::read_interrupts();
    if (int_val & USB_ISTR_CTR)
    {
        PCD_EP_irq_handler();
    }
    if (int_val & USB_ISTR_RESET)
    {
        CUSB::clear_interrupt(USB_ISTR_RESET);
        PCD_reset_callback();
        PCD_set_address(0);
    }
    #warning TODO
}

void CUSBD::reset()
{
    // Open EP0 OUT
    PCD_EP_open(0x00, CUSB::EEPType::CTRL, USB_MAX_EP0_SIZE);
    m_OUT_ep[0].is_used = true;
    m_OUT_ep[0].maxpacket = USB_MAX_EP0_SIZE;

    // Open EP0 IN
    PCD_EP_open(0x80, CUSB::EEPType::CTRL, USB_MAX_EP0_SIZE);
    m_IN_ep[0].is_used = true;
    m_IN_ep[0].maxpacket = USB_MAX_EP0_SIZE;

    if (m_class != nullptr)
    {
        m_class->de_init();
    }
}

void CUSBD::PCD_init()
{
    // initialize hardware
    CRCC::set_clk_APB1_enabled(APB1_USB, true);
    CORTEX::NVIC::enable_and_set_prior_IRQ(USB_LP_CAN1_RX0_IRQn, 0, 0);

    // Disable the Interrupts
    PCD_disable();

    // Init the Core (common init.)
    CUSB::core_init();

    // Force Device Mode
    CUSB::set_current_mode(CUSB::EMode::DEVICE);

    // Init endpoints structures
    for (uint32_t i=0 ; i<m_dev_endpoints ; ++i)
    {
        m_IN_ep[i].num = i;
        m_IN_ep[i].is_in = true;
        m_IN_ep[i].tx_fifo_num = i;
        m_IN_ep[i].type = CUSB::EEPType::CTRL;
        m_IN_ep[i].maxpacket = 0;
        m_IN_ep[i].xfer_buff = 0;
        m_IN_ep[i].xfer_len = 0;

        m_OUT_ep[i].num = i;
        m_OUT_ep[i].is_in = false;
        m_OUT_ep[i].type = CUSB::EEPType::CTRL;
        m_OUT_ep[i].maxpacket = 0;
        m_OUT_ep[i].xfer_buff = 0;
        m_OUT_ep[i].xfer_len = 0;
    }

    // Init Device
    CUSB::dev_init();

    m_USB_address = 0;

    CUSB::dev_disconnected();
}

void CUSBD::PCD_PMA_config(uint32_t ep_addr, EKind ep_kind, uint32_t pma_addr)
{
    CUSB::EP_t* p_ep;
    if ((ep_addr & 0x80) == 0x80)
    {
        p_ep = &m_IN_ep[ep_addr & EP_ADDR_MSK];
    }
    else
    {
        p_ep = &m_OUT_ep[ep_addr & EP_ADDR_MSK];
    }

    if (ep_kind == EKind::SNG_BUF)
    {
        p_ep->doublebuffer = false;
        p_ep->pmaadress = pma_addr;
    }
    else
    {
        p_ep->doublebuffer = true;
        p_ep->pmaaddr0 = pma_addr & 0xFFFFU;
        p_ep->pmaaddr1 = ((pma_addr & 0xFFFF0000U) >> 16);
    }
}

void CUSBD::PCD_start()
{
    PCD_enable();
    PCD_set_connection_state(true);
    CUSB::dev_connect();
}

void CUSBD::PCD_EP_open(uint32_t ep_addr, CUSB::EEPType ep_type, uint32_t ep_mps)
{
    CUSB::EP_t* p_ep;
    if ((ep_addr & 0x80))
    {
        p_ep = &m_IN_ep[ep_addr & EP_ADDR_MSK];
        p_ep->is_in = true;
    }
    else
    {
        p_ep = &m_OUT_ep[ep_addr & EP_ADDR_MSK];
        p_ep->is_in = false;
    }

    p_ep->num = ep_addr & EP_ADDR_MSK;
    p_ep->maxpacket = ep_mps;
    p_ep->type = ep_type;

    if (p_ep->is_in)
    {
        // Assign a Tx FIFO
        p_ep->tx_fifo_num = p_ep->num;
    }
    // Set initial data PID
    if (ep_type == CUSB::EEPType::BULK)
    {
        p_ep->data_pid_start = 0;
    }
    CUSB::activate_endpoint(p_ep);
}

void CUSBD::PCD_EP_irq_handler()
{
    //
}

void CUSBD::PCD_reset_callback()
{
    m_speed = EUSBSpeed::HIGH;
    reset();
}

void CUSBD::PCD_set_address(uint32_t addr)
{
    m_USB_address = addr;
    CUSB::set_dev_address(addr);
}
