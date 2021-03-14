#include "usbd_descr.h"
#include "core.h"

#define USBD_VID                        1155
#define USBD_LANGID_STRING              1033
#define USBD_MANUFACTURER_STRING        "andreil"
#define USBD_PID_FS                     22336
#define USBD_PRODUCT_STRING_FS          "STM32 Virtual ComPort"
#define USBD_CONFIGURATION_STRING_FS    "CDC Config"
#define USBD_INTERFACE_STRING_FS        "CDC Interface"

#define  USB_SIZ_STRING_SERIAL          0x1A

#define         DEVICE_ID1              (UID_BASE)
#define         DEVICE_ID2              (UID_BASE + 0x4)
#define         DEVICE_ID3              (UID_BASE + 0x8)

#define __ALIGN_END    __attribute__ ((aligned (4U)))

uint8_t FS_DeviceDesc[USB_LEN_DEV_DESC] __ALIGN_END =
{
    0x12,                       /*bLength */
    USB_DESC_TYPE_DEVICE,       /*bDescriptorType*/
    0x00,                       /*bcdUSB */
    0x02,
    0x02,                       /*bDeviceClass*/
    0x02,                       /*bDeviceSubClass*/
    0x00,                       /*bDeviceProtocol*/
    USB_MAX_EP0_SIZE,           /*bMaxPacketSize*/
    LOBYTE(USBD_VID),           /*idVendor*/
    HIBYTE(USBD_VID),           /*idVendor*/
    LOBYTE(USBD_PID_FS),        /*idProduct*/
    HIBYTE(USBD_PID_FS),        /*idProduct*/
    0x00,                       /*bcdDevice rel. 2.00*/
    0x02,
    USBD_IDX_MFC_STR,           /*Index of manufacturer  string*/
    USBD_IDX_PRODUCT_STR,       /*Index of product string*/
    USBD_IDX_SERIAL_STR,        /*Index of serial number string*/
    USBD_MAX_NUM_CONFIGURATION  /*bNumConfigurations*/
};

uint8_t LangIDDesc[USB_LEN_LANGID_STR_DESC] __ALIGN_END =
{
    USB_LEN_LANGID_STR_DESC,
    USB_DESC_TYPE_STRING,
    LOBYTE(USBD_LANGID_STRING),
    HIBYTE(USBD_LANGID_STRING)
};

uint8_t StrDesc[USBD_MAX_STR_DESC_SIZ] __ALIGN_END;

uint8_t StringSerial[USB_SIZ_STRING_SERIAL] __ALIGN_END = {
    USB_SIZ_STRING_SERIAL,
    USB_DESC_TYPE_STRING,
};

static void IntToUnicode(uint32_t value, uint8_t * pbuf, uint8_t len)
{
    for (uint8_t idx = 0; idx < len; idx++)
    {
        if (((value >> 28)) < 0xA)
        {
            pbuf[2 * idx] = (value >> 28) + '0';
        }
        else
        {
            pbuf[2 * idx] = (value >> 28) + 'A' - 10;
        }
        value = value << 4;
        pbuf[2 * idx + 1] = 0;
    }
}

static void Get_SerialNum(void)
{
    uint32_t deviceserial0, deviceserial1, deviceserial2;

    deviceserial0 = *(uint32_t *) DEVICE_ID1;
    deviceserial1 = *(uint32_t *) DEVICE_ID2;
    deviceserial2 = *(uint32_t *) DEVICE_ID3;

    deviceserial0 += deviceserial2;

    if (deviceserial0 != 0)
    {
        IntToUnicode(deviceserial0, &StringSerial[2], 8);
        IntToUnicode(deviceserial1, &StringSerial[18], 4);
    }
}

uint8_t* CUSBDDescr::device_descriptor(EUSBSpeed speed, uint16_t* length)
{
    (void)(speed);
    *length = sizeof(FS_DeviceDesc);
    return FS_DeviceDesc;
}

uint8_t* CUSBDDescr::lang_ID_descriptor(EUSBSpeed speed, uint16_t* length)
{
    (void)(speed);
    *length = sizeof(LangIDDesc);
    return LangIDDesc;
}

uint8_t* CUSBDDescr::manufacturer_str_descriptor(EUSBSpeed speed, uint16_t* length)
{
    (void)(speed);
    #warning USBD_GetString((uint8_t *)USBD_MANUFACTURER_STRING, StrDesc, length);
    return StrDesc;
}

uint8_t* CUSBDDescr::product_str_descriptor(EUSBSpeed speed, uint16_t* length)
{
    if (speed == EUSBSpeed::HIGH)
    {
        #warning USBD_GetString((uint8_t*)USBD_PRODUCT_STRING_FS, StrDesc, length);
    }
    else
    {
        #warning USBD_GetString((uint8_t*)USBD_PRODUCT_STRING_FS, StrDesc, length);
    }
    return StrDesc;
}

uint8_t* CUSBDDescr::serial_str_descriptor(EUSBSpeed speed, uint16_t* length)
{
    (void)(speed);
    *length = sizeof(USB_SIZ_STRING_SERIAL);
    Get_SerialNum();
    return StringSerial;
}

uint8_t* CUSBDDescr::config_str_descriptor(EUSBSpeed speed, uint16_t* length)
{
    if (speed == EUSBSpeed::HIGH)
    {
        #warning USBD_GetString((uint8_t*)USBD_CONFIGURATION_STRING_FS, StrDesc, length);
    }
    else
    {
        #warning USBD_GetString((uint8_t*)USBD_CONFIGURATION_STRING_FS, StrDesc, length);
    }
    return StrDesc;
}

uint8_t* CUSBDDescr::interface_str_descriptor(EUSBSpeed speed, uint16_t* length)
{
    if (speed == EUSBSpeed::HIGH)
    {
        #warning USBD_GetString((uint8_t*)USBD_INTERFACE_STRING_FS, StrDesc, length);
    }
    else
    {
        #warning USBD_GetString((uint8_t*)USBD_INTERFACE_STRING_FS, StrDesc, length);
    }
    return StrDesc;
}
