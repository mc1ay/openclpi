#
# this file was created by a computer. trust it.
#

# compiler tools
XILINX_VIVADO_HLS ?= $(XILINX_SDX)/Vivado_HLS

SDX_CXX ?= $(XILINX_SDX)/bin/xcpp
XOCC ?= $(XILINX_SDX)/bin/xocc
EMCONFIGUTIL = $(XILINX_SDX)/bin/emconfigutil --od .
RM = rm -f
RMDIR = rm -rf

SDX_PLATFORM = xilinx_u200_xdma_201820_1

# host compiler global settings
CXXFLAGS += -DSDX_PLATFORM=$(SDX_PLATFORM) -D__USE_XOPEN2K8 -I/opt/xilinx/xrt/include/ -I/opt/xilinx/Vivado/2018.2.xdf/include/ -O0 -g -Wall -c -fmessage-length=0 -std=c++14
LDFLAGS += -lxilinxopencl -lpthread -lrt -lstdc++ -L/opt/xilinx/xrt/lib/

# kernel compiler global settings
XOCC_OPTS = -t sw_emu --platform $(SDX_PLATFORM) --save-temps  

#
# OpenCL kernel files
#

BINARY_CONTAINERS += binary_container_1.xclbin

BUILD_SUBDIRS += binary_container_1
BINARY_CONTAINER_1_OBJS += binary_container_1/add_point.xo
ALL_KERNEL_OBJS += binary_container_1/add_point.xo

ALL_MESSAGE_FILES = $(subst .xo,.mdb,$(ALL_KERNEL_OBJS)) $(subst .xclbin,.mdb,$(BINARY_CONTAINERS))

#
# host files
#

HOST_OBJECTS += src/clpi.o
HOST_OBJECTS += src/xcl.o

HOST_EXE = picalc.exe

BUILD_SUBDIRS += src/

EMCONFIG_FILE = emconfig.json

#
# primary build targets
#

.PHONY: all clean
all: $(BINARY_CONTAINERS) $(HOST_EXE) $(EMCONFIG_FILE)

.NOTPARALLEL: clean

clean:
	-$(RM) $(BINARY_CONTAINERS) $(ALL_KERNEL_OBJS) $(ALL_MESSAGE_FILES)  $(EMCONFIG_FILE) $(HOST_EXE) $(HOST_OBJECTS)
	-$(RM) *.xclbin.sh
	-$(RMDIR) $(BUILD_SUBDIRS)
	-$(RMDIR) _xocc*
	-$(RMDIR) .Xil

.PHONY: incremental
incremental: all

include makeemconfig.mk

nothing:

#
# binary container: binary_container_1.xclbin
#

binary_container_1/add_point.xo: ../src/pi.cl
	@mkdir -p $(@D)
	-@$(RM) $@
	$(XOCC) $(XOCC_OPTS) -c -k add_point -g  --nk add_point:1 --messageDb $(subst .xo,.mdb,$@) -I"$(<D)" --xp misc:solution_name=add_point --temp_dir binary_container_1 --report_dir binary_container_1/reports --log_dir binary_container_1/logs -o"$@" "$<"

binary_container_1.xclbin: $(BINARY_CONTAINER_1_OBJS)
	-@echo $(XOCC) $(XOCC_OPTS) -l --nk add_point:1 -g --messageDb $(subst .xclbin,.mdb,$@) --xp misc:solution_name=link --temp_dir binary_container_1 --report_dir binary_container_1/reports --log_dir binary_container_1/logs --remote_ip_cache /data/workspace_pi/ip_cache -o"$@" $(BINARY_CONTAINER_1_OBJS) > binary_container_1.xclbin.sh
	$(XOCC) $(XOCC_OPTS) -l --nk add_point:1 -g --messageDb $(subst .xclbin,.mdb,$@) --xp misc:solution_name=link --temp_dir binary_container_1 --report_dir binary_container_1/reports --log_dir binary_container_1/logs --remote_ip_cache /data/workspace_pi/ip_cache -o"$@" $(BINARY_CONTAINER_1_OBJS)

#
# host rules
#

src/clpi.o: ../src/clpi.cpp ../src/clpi.h
	@mkdir -p $(@D)
	$(SDX_CXX) $(CXXFLAGS) -DSDX_PLATFORM=$(SDX_PLATFORM) -D__USE_XOPEN2K8 -I/opt/xilinx/xrt/include/ -I/opt/xilinx/Vivado/2018.2.xdf/include/ -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"

src/xcl.o: ../src/xcl.cpp ../src/xcl.h
	@mkdir -p $(@D)
	$(SDX_CXX) $(CXXFLAGS) -DSDX_PLATFORM=$(SDX_PLATFORM) -D__USE_XOPEN2K8 -I/opt/xilinx/xrt/include/ -I/opt/xilinx/Vivado/2018.2.xdf/include/ -O0 -g -Wall -c -fmessage-length=0 -o "$@" "$<"

$(HOST_EXE): $(HOST_OBJECTS)
	$(SDX_CXX) -o "$@" $(+) $(LDFLAGS) -lxilinxopencl -lpthread -lrt -lstdc++ -L/opt/xilinx/xrt/lib/

#
# emulation configuration file
#

$(EMCONFIG_FILE): makeemconfig.mk
	$(EMCONFIGUTIL) --nd $(NUMBER_OF_DEVICES)  --platform $(SDX_PLATFORM)
	-@$(RMDIR) TempConfig .Xil/configutil*

