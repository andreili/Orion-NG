OBJS :=
INC :=

OBJS += app.o
OBJS += display.o
OBJS += fonts.o
OBJS += init.o
OBJS += isr_stm32f103xb.o
OBJS += utils.o
OBJS += exceptions.o
ifneq ($(debug),)
OBJS += shell.o
OBJS += xprintf.o
OBJS += uart_fifo.o
OBJS += drv_uart.o
endif

OBJS += task_mgr.o
OBJS += edid_ctrl.o
OBJS += drv_video.o
OBJS += drv_pll.o
OBJS += drv_vcap.o

#OBJS += usbd.o
#OBJS += usbd_descr.o
#OBJS += usbd_cdc.o

OBJS += drv_rcc.o
OBJS += drv_nvic.o
OBJS += drv_gpio.o
OBJS += drv_afio.o
OBJS += drv_i2c.o
OBJS += drv_spi.o
#OBJS += drv_usb.o

OBJS += hil.o

#OBJS += xprintf.o

INC += app/
INC += app/gui
INC += app/hw
INC += app/interfaces
INC += drv/
INC += core/
#INC += hal/