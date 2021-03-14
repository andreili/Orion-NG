#pragma once

#include "core.h"
#include "usbd_interface.h"
#include "usbd_conf.h"

#define EP_ADDR_MSK                            0xFU

class CUSB
{
public:
    enum class EMode
    {
        HOST,
        DEVICE,
    };
    enum class EEPType
    {
        CTRL,
        ISOC,
        BULK,
        INTR,
        MSK,
    };
    typedef struct
    {
        uint8_t   num;              /*!< Endpoint number
                                         This parameter must be a number between Min_Data = 1 and Max_Data = 15    */
        bool      is_in;            /*!< Endpoint direction
                                         This parameter must be a number between Min_Data = 0 and Max_Data = 1     */
        bool      is_stall;         /*!< Endpoint stall condition
                                         This parameter must be a number between Min_Data = 0 and Max_Data = 1     */
        uint8_t   data_pid_start;   /*!< Initial data PID
                                         This parameter must be a number between Min_Data = 0 and Max_Data = 1     */
        bool      doublebuffer;     /*!< Double buffer enable
                                         This parameter can be 0 or 1                                              */
        bool      is_used;
        uint8_t   *xfer_buff;       /*!< Pointer to transfer buffer                                                */
        uint8_t   xfer_fill_db;     /*!< double buffer Need to Fill new buffer  used with bulk_in                */
        uint16_t  pmaadress;        /*!< PMA Address
                                         This parameter can be any value between Min_addr = 0 and Max_addr = 1K    */
        uint16_t  pmaaddr0;         /*!< PMA Address0
                                         This parameter can be any value between Min_addr = 0 and Max_addr = 1K    */
        uint16_t  pmaaddr1;         /*!< PMA Address1
                                         This parameter can be any value between Min_addr = 0 and Max_addr = 1K    */
        uint16_t  tx_fifo_num;      /*!< This parameter is not required by USB Device FS peripheral, it is used
                                         only by USB OTG FS peripheral
                                         This parameter is added to ensure compatibility across USB peripherals    */
        CUSB::EEPType type;         /*!< Endpoint type
                                         This parameter can be any value of @ref USB_EP_Type                       */
        uint32_t  xfer_len;         /*!< Current transfer length                                                   */
        uint32_t  xfer_count;       /*!< Partial transfer length in case of multi packet transfer                  */
        uint32_t  xfer_len_db;      /*!< double buffer transfer length used with bulk double buffer in           */
        uint32_t  maxpacket;        /*!< Endpoint Max packet size
                                         This parameter must be a number between Min_Data = 0 and Max_Data = 64KB  */
        uint32_t  status;
        uint32_t  total_length;
        uint32_t  rem_length;
    } EP_t;

    static void core_init() { /* nothing - only for FS devices */ }
    static inline void disable_global_int()
    {
        MODIFY_REG32(&USB->CNTR, (USB_CNTR_CTRM  | USB_CNTR_WKUPM |
                                 USB_CNTR_SUSPM | USB_CNTR_ERRM |
                                 USB_CNTR_SOFM | USB_CNTR_ESOFM |
                                 USB_CNTR_RESETM), 0);
    }
    static inline void enable_global_int()
    {
        WRITE_REG32(&USB->ISTR, 0);
        WRITE_REG32(&USB->CNTR, (USB_CNTR_CTRM  | USB_CNTR_WKUPM |
                                USB_CNTR_SUSPM | USB_CNTR_ERRM |
                                USB_CNTR_SOFM | USB_CNTR_ESOFM |
                                USB_CNTR_RESETM));
    }
    static void set_current_mode(EMode mode) { (void)(mode); /* nothing - only for FS devices */ }
    static void dev_init();
    static void dev_disconnected() { /* nothing - only for FS devices */ }
    static void dev_connect() { /* nothing - only for FS devices */ }
    static void activate_endpoint(EP_t* p_ep);

    static uint32_t read_interrupts() { return READ_REG32(&USB->ISTR); }
    static void clear_interrupt(uint32_t mask) { MODIFY_REG32(&USB->ISTR, mask, 0); }
    static void set_dev_address(uint32_t addr) { if (addr == 0) { WRITE_REG32(&USB->DADDR, addr); } }
private:
};
