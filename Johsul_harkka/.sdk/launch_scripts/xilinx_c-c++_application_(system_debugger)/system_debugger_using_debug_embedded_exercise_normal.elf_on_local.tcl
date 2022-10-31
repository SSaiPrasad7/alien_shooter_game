connect -url tcp:127.0.0.1:3121
source P:/StudentDocuments/introduction_to_embedded_systems/Project_work_material_20221028/JoSu_project/JoSu_project/Johsul_harkka/Exercise/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA" && level==0} -index 1
fpga -file P:/StudentDocuments/introduction_to_embedded_systems/Project_work_material_20221028/JoSu_project/JoSu_project/Johsul_harkka/Exercise/top.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA"} -index 0
loadhw -hw P:/StudentDocuments/introduction_to_embedded_systems/Project_work_material_20221028/JoSu_project/JoSu_project/Johsul_harkka/Exercise/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA"} -index 0
dow P:/StudentDocuments/introduction_to_embedded_systems/Project_work_material_20221028/JoSu_project/JoSu_project/Johsul_harkka/Embedded_Exercise_normal/Debug/Embedded_Exercise_normal.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Xilinx PYNQ-Z1 003017A4CC2AA"} -index 0
con
