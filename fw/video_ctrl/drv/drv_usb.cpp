#include "drv_usb.h"

#define BTABLE_ADDRESS                         0x000U
#define PCD_SET_ENDPOINT(USBx, bEpNum, wRegValue)  (*(__IO uint16_t *)(&(USBx)->EP0R + ((bEpNum) * 2U)) = (uint16_t)(wRegValue))
#define PCD_GET_ENDPOINT(USBx, bEpNum)             (*(__IO uint16_t *)(&(USBx)->EP0R + ((bEpNum) * 2U)))

void CUSB::dev_init()
{
    WRITE_REG32(&USB->CNTR, USB_CNTR_FRES);
    WRITE_REG32(&USB->CNTR, 0);
    WRITE_REG32(&USB->ISTR, 0);
    WRITE_REG32(&USB->BTABLE, BTABLE_ADDRESS);
}

void CUSB::activate_endpoint(EP_t* p_ep)
{
    uint16_t reg_val = PCD_GET_ENDPOINT(USB, p_ep->num);
    switch (p_ep->type)
    {
    case EEPType::CTRL:
        reg_val |= USB_EP_CONTROL;
        break;
    case EEPType::BULK:
        reg_val |= USB_EP_BULK;
        break;
    case EEPType::INTR:
        reg_val |= USB_EP_INTERRUPT;
        break;
    case EEPType::ISOC:
        reg_val |= USB_EP_ISOCHRONOUS;
        break;
    default:
        ASSERT(false);
        break;
    }
}
