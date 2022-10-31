connect -url tcp:127.0.0.1:3121
source P:/PYNQ-base-overlay-2.0/boards/Pynq-Z1/base/base/base.sdk/system_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CE32A"} -index 0
loadhw -hw P:/PYNQ-base-overlay-2.0/boards/Pynq-Z1/base/base/base.sdk/system_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CE32A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CE32A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CE32A"} -index 0
dow P:/PYNQ-base-overlay-2.0/boards/Pynq-Z1/base/base/base.sdk/toka_testi/Debug/toka_testi.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CE32A"} -index 0
con
