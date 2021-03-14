RM := rm -rf

PROJ_NAME = video_ctrl
WORK_DIR = out
LD_SCRIPT = STM32F103CBTX_FLASH.ld
DEV_CORE = M3
DEV_FAMILY = m3
DEV_DEF = STM32F103xB

EXECUTABLE = $(WORK_DIR)/$(PROJ_NAME).elf
LIST_FILE = $(WORK_DIR)/$(PROJ_NAME).list
BIN_FILE = $(WORK_DIR)/$(PROJ_NAME).bin
HEX_FILE = $(WORK_DIR)/$(PROJ_NAME).hex
MAP_FILE = $(WORK_DIR)/$(PROJ_NAME).map
MIF_FILE = $(WORK_DIR)/$(PROJ_NAME).mif

ARCH_FLAGS = -mcpu=cortex-$(DEV_FAMILY) -mfloat-abi=soft -mthumb -specs=nano.specs -specs=nosys.specs
WARN_FLAGS = -Wall -Wextra -Wfatal-errors -Wno-unknown-pragmas
ifneq ($(debug),)
	DEBUG_FLAGS = -g3 -DDEBUG
endif
OPTIMIZE_FLAGS = -Os -ffunction-sections -fdata-sections -fearly-inlining -finline-small-functions
ifneq ($(lto),)
	OPTIMIZE_FLAGS += -flto
endif
C_FLAGS := $(ARCH_FLAGS) -fno-exceptions -fstack-usage -MMD -MP -D$(DEV_DEF) $(OPTIMIZE_FLAGS) $(WARN_FLAGS) $(DEBUG_FLAGS)
C_FLAGS += -Wno-strict-aliasing
CPP_FLAGS := $(C_FLAGS) -std=gnu++1z -fno-rtti -fno-threadsafe-statics -fno-use-cxa-atexit
LD_FLAGS = $(ARCH_FLAGS) -T"$(LD_SCRIPT)" -Wl,-Map="$(MAP_FILE)" -Wl,--gc-sections -nodefaultlibs -nostartfiles -static
LIBS = -Wl,--start-group -lc -lm -lstdc++ -lsupc++ -Wl,--end-group

PROJ_DIR := $(shell pwd)

include $(PROJ_NAME).mak

OBJECTS := $(patsubst %, $(WORK_DIR)/%, $(OBJS))
INC_DIR := $(patsubst %, -I%, $(INC))
vpath %.c $(INC)
vpath %.cpp $(INC)
vpath %.hpp $(INC)

INC_DIR := $(sort $(INC_DIR))

DEPFILES := $(OBJECTS:%.o=%.d)

.SUFFIXES: .cpp .c .o

# All Target
all: $(EXECUTABLE) secondary-outputs

$(WORK_DIR)/%.o: %.c
	$(info Compile $<)
	@arm-none-eabi-gcc $(C_FLAGS) $(INC_DIR) -MF "$(WORK_DIR)/$*.d" -c "$<" -o "$@"

$(WORK_DIR)/%.o: %.cpp
	$(info Compile $<)
	@arm-none-eabi-g++ $(CPP_FLAGS) $(INC_DIR) -MF "$(WORK_DIR)/$*.d" -c "$<" -o "$@"

%.elf: $(WORK_DIR) $(OBJECTS)
	$(info Link $@)
	@arm-none-eabi-g++ -o "$@" $(LD_FLAGS) $(OBJECTS) #$(LIBS)

size.stdout: $(EXECUTABLE)
	@arm-none-eabi-size  $(EXECUTABLE)

$(LIST_FILE): $(EXECUTABLE)
	$(info Generate list file)
	@arm-none-eabi-objdump -hSCl --inlines $(EXECUTABLE) > "$(LIST_FILE)"

$(BIN_FILE): $(EXECUTABLE)
	$(info Generate binary file)
	@arm-none-eabi-objcopy -O binary $(EXECUTABLE) "$(BIN_FILE)"
	$(info Generate Intel-HEX file)
	@arm-none-eabi-objcopy -O ihex $(EXECUTABLE) "$(HEX_FILE)"

$(MIF_FILE): $(BIN_FILE)
	$(info Generate MIF file)
	@mem_init_gen.py -i -of MIF --width 4 $(BIN_FILE) > $(MIF_FILE)

$(WORK_DIR):
	$(info Create work directory)
	@mkdir -p  $(WORK_DIR)

# Other Targets
clean:
	$(info Delete work directory)
	@$(RM) $(WORK_DIR)

run: size.stdout $(BIN_FILE)
	$(info Programming device)
	@./tools/ST-LINK_CLI.exe -ME -P $(BIN_FILE) 0x08000000 -V -HardRst

secondary-outputs: size.stdout $(LIST_FILE) $(BIN_FILE)

.PHONY: all clean
.SECONDARY:

%.d: ;

include $(DEPFILES)
