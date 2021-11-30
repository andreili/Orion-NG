#pragma once

#include "usbd_descr.h"
#include "drv_usb.h"

class CUSBD
{
public:
    void init();
    void register_class(CUSBDInterface* interface) { m_class = interface; }
    void start() { PCD_start(); }
    void PCD_irq_handler();
private:
    uint32_t        m_dev_endpoints;
    EUSBSpeed       m_speed;
    uint32_t        m_USB_address;
    CUSBDInterface* m_class;

    enum class EKind
    {
        SNG_BUF,
        DBL_BUF,
    };

    CUSB::EP_t      m_IN_ep[8];
    CUSB::EP_t      m_OUT_ep[8];

    void reset();

    void PCD_init();
    void PCD_disable() { CUSB::disable_global_int(); }
    void PCD_enable() { CUSB::enable_global_int(); }
    void PCD_PMA_config(uint32_t ep_addr, EKind ep_kind, uint32_t pma_addr);
    void PCD_start();
    void PCD_set_connection_state(bool fl) { (void)(fl); }
    void PCD_EP_open(uint32_t ep_addr, CUSB::EEPType ep_type, uint32_t ep_mps);

    void PCD_EP_irq_handler();
    void PCD_reset_callback();
    void PCD_set_address(uint32_t addr);
};
